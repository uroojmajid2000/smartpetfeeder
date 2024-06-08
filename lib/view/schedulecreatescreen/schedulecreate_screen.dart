import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:smart_pet_feeder/res/components/notification_widget.dart';
import 'package:smart_pet_feeder/res/components/schedule_done.dart';
import 'package:smart_pet_feeder/res/routes/routes_name.dart';
import 'package:simple_table_calendar/simple_table_calendar.dart';
import 'package:smart_pet_feeder/view/Signup/signup_controller.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:time_picker_spinner_pop_up/time_picker_spinner_pop_up.dart';

class ScheduleCreateScreen extends StatefulWidget {
  const ScheduleCreateScreen({super.key});

  @override
  State<ScheduleCreateScreen> createState() => _ScheduleCreateScreenState();
}

class _ScheduleCreateScreenState extends State<ScheduleCreateScreen> {
  final SignupController _signupController = Get.put(SignupController());
  int _selectedIndex = 0;
  DateTime? _selectedDay;
  DateTime? _selectedTime;
  DateTime _focusedDay = DateTime.now();
  bool isCreateSelected = true;
  bool _isLoggingOut = false;

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

  Widget _buildHomeScreen() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Text(
            'Scheduler',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            color: Color(0xff154C79),
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isCreateSelected = true;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      'Create',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 1,
                  color: Color(0xFFD9D9D9),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isCreateSelected = false;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      'Scheduled',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          if (isCreateSelected) ...[
            TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now(),
              calendarFormat: CalendarFormat.month,
              availableCalendarFormats: const {
                CalendarFormat.month: 'Month',
              },
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay; // update `_focusedDay` here as well
                });
                print('Selected day: $selectedDay');
              },
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ' Select Time',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TimePickerSpinnerPopUp(
                      mode: CupertinoDatePickerMode.time,
                      initTime: _selectedTime != null
                          ? _selectedTime!
                          : DateTime.now(),
                      use24hFormat: true,
                      onChange: (dateTime) {
                        setState(() {
                          _selectedTime = dateTime;
                        });
                        print('Selected day: $_selectedTime');
                      },
                    ),
                  ]),
            ),
            SizedBox(
              height: 8,
            ),

            ElevatedButton(
              onPressed: () async {
                if (_selectedDay == null || _selectedTime == null) {
                  Fluttertoast.showToast(
                    msg: 'Please Select Date & Time',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                  );

                  return;
                }

                var result = await _signupController.createSchedule(
                  date:
                      '${_selectedDay!.day}-${_selectedDay!.month}-${_selectedDay!.year}',
                  time:
                      '${_selectedTime!.hour}:${_selectedTime!.minute} ${_selectedTime!.hour < 12 ? 'AM' : 'PM'}',
                );
                if (result['success']) {
                  print('Schedule created successfully');
                  Fluttertoast.showToast(
                    msg: result['message'],
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                  );
                } else {
                  print('Failed to create schedule: ${result['message']}');
                }
              },
              child: Text('Schedule'),
            )

            // Container(
            //   width: 129,
            //   height: 35,
            //   decoration: ShapeDecoration(
            //     color: Color(0xFF7487F9),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(100),
            //     ),
            //     shadows: [
            //       BoxShadow(
            //         color: Color(0x3F000000),
            //         blurRadius: 4,
            //         offset: Offset(0, 4),
            //         spreadRadius: 0,
            //       )
            //     ],
            //   ),
            //   child: Center(
            //     child: Text(
            //       'Schedule',
            //       textAlign: TextAlign.center,
            //       style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 16,
            //         fontFamily: 'Montserrat',
            //         fontWeight: FontWeight.w400,
            //       ),
            //     ),
            //   ),
            // ),
          ] else ...[
            SizedBox(
              height: 30,
            ),
            scheduledDone(
              work: 'Drop Food',
              colorLine: Color(0xff47CA9B),
            ),
            SizedBox(
              height: 10,
            ),
            scheduledDone(
              work: 'Drop Water',
              colorLine: Color(0xff00A3FF),
            ),
            SizedBox(
              height: 310,
            )
          ],
        ],
      ),
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
                                Get.toNamed(RouteName.layoutscreen);
                              },
                              child: Image.asset("assets/icons/temp_icon.png"),
                            ),
                            SizedBox(height: 25),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(RouteName.camerascreen);
                              },
                              child:
                                  Image.asset("assets/icons/camera_icon.png"),
                            ),
                            SizedBox(height: 25),
                            GestureDetector(
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
