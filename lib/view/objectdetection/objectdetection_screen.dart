import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_pet_feeder/res/components/notification_widget.dart';
import 'package:smart_pet_feeder/res/routes/routes_name.dart';

class ObjectDetectionScreen extends StatefulWidget {
  const ObjectDetectionScreen({super.key});

  @override
  State<ObjectDetectionScreen> createState() => _ObjectDetectionScreenState();
}

class _ObjectDetectionScreenState extends State<ObjectDetectionScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
            details: 'High temperature detected!',
            time: '2m ago',
          ),
          SizedBox(
            height: 10,
          ),
          NotificationWidget(
            color: Color(0xffF87B20),
            heading: 'Humidity',
            details: 'Humidity reached 50%',
            time: '6m ago',
          ),
          SizedBox(
            height: 10,
          ),
          NotificationWidget(
            color: Color(0xff00A12D),
            heading: 'Moisture',
            details: 'Moisture reached 30%',
            time: '32m ago',
          ),
        ],
      ),
    );
  }

  Widget _buildHomeScreen() {
    return Column(
      children: [
        SizedBox(
          height: 80,
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
                      child: Text("33°C"),
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
                      child: Text("30°C"),
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
                      child: Text("33°C"),
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset("assets/icons/back_icon.png"),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: ShapeDecoration(
                            color: Colors.red,
                            image: DecorationImage(
                              image:
                                  //  NetworkImage(
                                  //     "https://via.placeholder.com/40x40"),
                                  AssetImage("assets/images/profile_image.png"),
                              fit: BoxFit.fill,
                            ),
                            shape: OvalBorder(),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 60,
                      height: Get.height * 0.86,
                      color: Color(0xff6C8DA8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 150,
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedIndex = 0;
                                    });
                                  },
                                  // onTap: () {
                                  //   Get.toNamed(RouteName.homescreen);
                                  // },
                                  child: Image.asset(
                                      "assets/icons/temp_icon.png")),
                              SizedBox(
                                height: 25,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(RouteName.objectdetectionscreen);
                                },
                                child:
                                    Image.asset("assets/icons/camera_icon.png"),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Get.toNamed(RouteName.schedulerscreen);
                                  },
                                  child: Image.asset(
                                      "assets/icons/calender_icon.png")),
                            ],
                          ),
                          // SizedBox(),
                          Spacer()
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: Get.height * 0.85,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 05,
                            ),
                            Text(
                              'Object \nDetection',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 43,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                children: [
                                  Container(
                                    height: 168,
                                    decoration: BoxDecoration(
                                      // color: Colors.amber,
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/cat_image.png"),

                                        // NetworkImage(
                                        //     "https://via.placeholder.com/292x168"),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Spacer()
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notification_add_rounded),
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
