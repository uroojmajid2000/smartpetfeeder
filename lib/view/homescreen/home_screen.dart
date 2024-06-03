import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:smart_pet_feeder/res/components/custom_button.dart';
import 'package:smart_pet_feeder/res/components/custom_password_textfield.dart';
import 'package:smart_pet_feeder/res/components/custom_textfield.dart';
import 'package:smart_pet_feeder/res/routes/routes_name.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                              height: 50,
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
                              height: 50,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
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
                                        decoration: BoxDecoration(
                                            color: Color(0xFFD9D9D9)),
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
                                        decoration: BoxDecoration(
                                            color: Color(0xFFD9D9D9)),
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
                                        decoration: BoxDecoration(
                                            color: Color(0xFFD9D9D9)),
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
