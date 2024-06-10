import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:smart_pet_feeder/res/components/notification_widget.dart';
import 'package:smart_pet_feeder/res/routes/routes_name.dart';
import 'package:smart_pet_feeder/view/Signup/signup_controller.dart';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  final SignupController _signupController = Get.put(SignupController());
  bool _isLoggingOut = false;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: source);
      setState(() {
        _imageFile = pickedFile;
      });
    } catch (e) {
      setState(() {
        _imageFile = null;
      });
    }
  }

  Widget _buildImageContainer() {
    if (_imageFile == null) {
      return const Center(child: Text('No image selected.'));
    } else {
      return kIsWeb
          ? Container(
              height: 168, width: 400, child: Image.network(_imageFile!.path))
          : Container(
              height: 168,
              width: 400,
              child: Image.file(File(_imageFile!.path)));
    }
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
          height: 80,
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
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              // Container(
              //   height: 168,
              //   decoration: BoxDecoration(
              //     // color: Colors.amber,
              //     image: DecorationImage(
              //       image: AssetImage("assets/images/cat_image.png"),

              //       // NetworkImage(
              //       //     "https://via.placeholder.com/292x168"),
              //       fit: BoxFit.fill,
              //     ),
              //   ),
              // )

              _buildImageContainer(),

              // FloatingActionButton(
              //   onPressed: () => _pickImage(ImageSource.gallery),
              //   heroTag: 'gallery',
              //   tooltip: 'Pick Image from Gallery',
              //   child: const Icon(Icons.photo),
              // ),
              // const SizedBox(height: 16),
              // FloatingActionButton(
              //   onPressed: () => _pickImage(ImageSource.camera),
              //   heroTag: 'camera',
              //   tooltip: 'Take a Photo',
              //   child: const Icon(Icons.camera_alt),
              // ),

              Container(
                color: Colors.green,
                child: Column(
                  children: [
                    GestureDetector(
                        onTap: () {
                          _pickImage(ImageSource.gallery);
                        },
                        child: Text("imGAE")),
                    SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                        onTap: () {
                          _pickImage(ImageSource.camera);
                        },
                        child: Text("CAMERA")),
                  ],
                ),
              )
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
                              // onTap: () {
                              //   setState(() {
                              //     _selectedIndex = 0;
                              //   });
                              // },
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
