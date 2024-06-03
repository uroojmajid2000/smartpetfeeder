import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_pet_feeder/res/routes/routes_name.dart';

class SchedulerScreen extends StatefulWidget {
  const SchedulerScreen({super.key});

  @override
  State<SchedulerScreen> createState() => _SchedulerScreenState();
}

class _SchedulerScreenState extends State<SchedulerScreen> {
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
                                    Get.toNamed(RouteName.homescreen);
                                  },
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
                              height: 10,
                            ),
                            Text(
                              'Scheduler',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Container(
                              color: Color(0xff154C79),
                              height: 50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
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
                                  Container(
                                    height: 50,
                                    width: 1,
                                    color: Color(0xFFD9D9D9),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Text(
                                      'Scheduled',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            // scheduledDone(
                            //   work: 'Drop Food',
                            //   colorLine: Color(0xff47CA9B),
                            // ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            // scheduledDone(
                            //   work: 'Drop Water',
                            //   colorLine: Color(0xff00A3FF),
                            // ),
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
      ),
    );
  }
}
