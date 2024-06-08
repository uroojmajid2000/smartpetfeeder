import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:smart_pet_feeder/res/components/custom_button.dart';
import 'package:smart_pet_feeder/res/components/custom_password_textfield.dart';
import 'package:smart_pet_feeder/res/components/custom_textfield.dart';
import 'package:smart_pet_feeder/res/routes/routes_name.dart';
import 'package:smart_pet_feeder/view/Signup/signup_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordValid = false;
  bool _isObscure = true;

  void _validatePassword(String password) {
    setState(() {
      _isPasswordValid = password.length >= 6; // Example condition
    });
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    final SignupController _signupController = Get.put(SignupController());

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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  SizedBox(height: 70),
                  Text(
                    'Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 50),
                  CustomTextField(
                    controller: _emailController,
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    onChanged: (value) {
                      print('Email: $value');
                    },
                  ),
                  SizedBox(height: 20),
                  CustomPasswordTextField(
                    controller: _passwordController,
                    hintText: 'Password',
                    obscureText: _isObscure,
                    textInputAction: TextInputAction.done,
                    onChanged: (value) {
                      print('Password: $value');
                      _validatePassword(value);
                    },
                    onSuffixIconPressed: _togglePasswordVisibility,
                  ),
                  SizedBox(height: 25),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteName.signupScreen);
                    },
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Don\'t have an account? ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: 'Sign Up',
                            style: TextStyle(
                              color: Color(0xFFF57366),
                              fontSize: 12,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 25),
                  CustomButton(
                    text: 'Login',
                    onTap: () async {
                      String email = _emailController.text;
                      String password = _passwordController.text;

                      Map<String, dynamic> response =
                          await _signupController.login(
                        email: email,
                        password: password,
                      );

                      if (response['success']) {
                        Fluttertoast.showToast(
                          msg: response['message'],
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                        );
                        Get.toNamed(RouteName.layoutscreen);
                      } else {
                        Fluttertoast.showToast(
                          msg: response['message'] ??
                              "Login failed. Please try again.",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
