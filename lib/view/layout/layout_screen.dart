import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_pet_feeder/res/components/notification_widget.dart';
import 'package:smart_pet_feeder/res/routes/routes_name.dart';
import 'package:smart_pet_feeder/view/Signup/signup_controller.dart';
import 'package:smart_pet_feeder/view/layout/notification_model.dart';
import 'package:smart_pet_feeder/view/layout/readin_model.dart';
import 'package:smart_pet_feeder/view/login/login_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  final SignupController _signupController = Get.put(SignupController());
  bool _isLoggingOut = false;
  ReadingModel? _readingData;
  NotificationMoel? _getNotifcation;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Timer? _dataTimer;
  Timer? _notificationTimer;

  @override
  void initState() {
    super.initState();
    fetchData();
    fetchNotification();
    _startTimers();
  }

  void _startTimers() {
    _dataTimer = Timer.periodic(Duration(seconds: 5), (timer) {
      fetchData();
    });
    _notificationTimer = Timer.periodic(Duration(seconds: 20), (timer) {
      fetchNotification();
    });
  }

  @override
  void dispose() {
    _dataTimer?.cancel();
    _notificationTimer?.cancel();
    super.dispose();
  }

  Future<void> fetchData() async {
    var result = await _signupController.getReadings();
    if (result['success']) {
      setState(() {
        _readingData = ReadingModel.fromJson(result['data']);
      });
    } else {}
  }

  Future<void> fetchNotification() async {
    var result = await _signupController.getNotifications();
    if (result['success']) {
      setState(() {
        _getNotifcation = NotificationMoel.fromJson(result['data']);
      });
    } else {}
  }

  Widget _getBody() {
    switch (_selectedIndex) {
      case 0:
        return _buildHomeScreen();
      case 1:
        return _buildNotificationScreen();
      default:
        return _buildHomeScreen();
    }
  }

  Widget _buildHomeScreen() {
    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        Text(
          'Live',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          'Readings',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 90,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Pet Name:  ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: Color(0xFFD9D9D9)),
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(_readingData?.data.petStatus ?? ""),
                    )),
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Text(
                    'Temperature:  ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: Color(0xFFD9D9D9)),
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          Text('${_readingData?.data.temperature}°C' ?? "0°C"),
                    )),
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Text(
                    'Humidity:  ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: Color(0xFFD9D9D9)),
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(_readingData?.data.humidity ?? "0"),
                    )),
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Text(
                    'Moisture:  ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: Color(0xFFD9D9D9)),
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(_readingData?.data.moisture ?? "0"),
                    )),
                  )
                ],
              ),
            ],
          ),
        ),
        Spacer()
      ],
    );
  }

  Widget _buildNotificationScreen() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Text(
            'Notifications',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 100,
          ),
          NotificationWidget(
            color: Color(0xffFF0000),
            heading: 'Temperature',
            details:
                _getNotifcation!.data!.temp ?? 'High temperature detected!',
            time: _getNotifcation!.data!.tempUpdatedAt ?? '2m ago',
          ),
          SizedBox(
            height: 10,
          ),
          NotificationWidget(
            color: Color(0xffF87B20),
            heading: 'Humidity',
            details: _getNotifcation!.data!.humidity ?? 'Humidity reached 50%',
            time: _getNotifcation!.data!.humidityUpdatedAt ?? '6m ago',
          ),
          SizedBox(
            height: 10,
          ),
          NotificationWidget(
            color: Color(0xff00A12D),
            heading: 'Moisture',
            details: _getNotifcation!.data!.moisture ?? 'Moisture reached 30%',
            time: _getNotifcation!.data!.moistureUpdatedAt ?? '32m ago',
          ),
          SizedBox(
            height: 10,
          ),
          // NotificationWidget(
          //   color: Color.fromARGB(255, 198, 238, 20),
          //   heading: 'Pet Status',
          //   details: _getNotifcation!.data!.petStatus ?? '',
          //   time: _getNotifcation!.data!.tempUpdatedAt ?? '32m ago',
          // ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff154C79),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/background_image.png',
              fit: BoxFit.cover,
            ),
            Column(
              children: [
                Container(
                  height: Get.height * 0.1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset("assets/icons/back_icon.png"),
                        Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: ShapeDecoration(
                                color: Colors.red,
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/profile_image.png"),
                                  fit: BoxFit.fill,
                                ),
                                shape: OvalBorder(),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            _isLoggingOut
                                ? CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : IconButton(
                                    icon: Icon(
                                      Icons.logout,
                                      color: Colors.white,
                                    ),
                                    onPressed: _isLoggingOut
                                        ? null
                                        : () async {
                                            setState(() {
                                              _isLoggingOut = true;
                                            });
                                            var result = await _signupController
                                                .logout();
                                            setState(() {
                                              _isLoggingOut = false;
                                            });
                                            if (result['success']) {
                                              Get.offAllNamed(
                                                  RouteName.loginScreen);
                                            } else {
                                              Get.snackbar(
                                                  'Error', result['message']);
                                            }
                                          },
                                  ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        color: Color(0xff6C8DA8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedIndex = 0;
                                });
                              },
                              child: Image.asset("assets/icons/temp_icon.png"),
                            ),
                            SizedBox(height: 25),
                            GestureDetector(
                              // onTap: () {
                              //   setState(() {
                              //     _selectedIndex = 0;
                              //   });
                              // },

                              onTap: () {
                                Get.toNamed(RouteName.camerascreen);
                              },
                              child:
                                  Image.asset("assets/icons/camera_icon.png"),
                            ),
                            SizedBox(height: 25),
                            GestureDetector(
                              // onTap: () {
                              //   setState(() {
                              //     _selectedIndex = 0;
                              //   });
                              // },

                              onTap: () {
                                Get.toNamed(RouteName.schedulecreatescreen);
                              },
                              child:
                                  Image.asset("assets/icons/calender_icon.png"),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: _getBody(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              // icon: Icon((_getNotifcation?.data?.notify_value >= 29
              //     ?"assets/icons/active.png"
              //     :
              //      Icons.notification_add
              //     ) as IconData?),
              // icon: _getNotifcation?.data?.notify_value >= 29
              //     ? Image.asset(
              //         "assets/icons/active.png",
              //         color: Colors.white,
              //         height: 24, // Specify the size of the icon
              //         width: 24,
              //       )
              //     : Icon(Icons.notifications),

                icon: Image.asset(
                "assets/icons/active.png",
                color: Colors.white,
                height: 24, // Specify the size of the icon
                width: 24,
              ),
              label: '',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          onTap: _onItemTapped,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Color(0xff154C79),
          unselectedItemColor: Color(0xffD9D9D9),
        ),
      ),
    );
  }
}
