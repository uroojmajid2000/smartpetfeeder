import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:smart_pet_feeder/res/components/custom_button.dart';
import 'package:smart_pet_feeder/res/components/custom_password_textfield.dart';
import 'package:smart_pet_feeder/res/components/custom_textfield.dart';
import 'package:smart_pet_feeder/res/routes/routes_name.dart';
import 'package:smart_pet_feeder/view/Signup/signup_controller.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _cnicController = TextEditingController();
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 70),
                    Text(
                      'Sign up',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Enter your details to \nstart using Smart Pet Feeder',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 30),
                    CustomTextField(
                      controller: _nameController,
                      hintText: 'Name',
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      onChanged: (value) {
                        print('Name: $value');
                      },
                    ),
                    SizedBox(height: 20),
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
                    SizedBox(height: 20),
                    CustomTextField(
                      controller: _contactController,
                      hintText: 'Contact',
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      onChanged: (value) {
                        print('Contact: $value');
                      },
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      controller: _cnicController,
                      hintText: 'CNIC',
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      onChanged: (value) {
                        print('CNIC: $value');
                      },
                    ),
                    SizedBox(height: 25),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteName.loginScreen);
                      },
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Already have an account? ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: 'Sign In',
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
                      text: 'Sign up',
                      onTap: () async {
                        String name = _nameController.text;
                        String email = _emailController.text;
                        String password = _passwordController.text;
                        String contact = _contactController.text;
                        String cnic = _cnicController.text;

                        Map<String, dynamic> result =
                            await _signupController.signup(
                          name: name,
                          email: email,
                          password: password,
                          password_confirmation: password,
                          contact: contact,
                          cnic: cnic,
                        );

                        Fluttertoast.showToast(
                          msg: result['message'],
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor:
                              result['success'] ? Colors.green : Colors.red,
                          textColor: Colors.white,
                        );

                        if (result['success']) {
                          Get.toNamed(RouteName.loginScreen);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
