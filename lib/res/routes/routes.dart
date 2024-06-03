import 'package:get/get.dart';
import 'package:smart_pet_feeder/res/routes/routes_name.dart';
import 'package:smart_pet_feeder/view/Signup/signup_screen.dart';
import 'package:smart_pet_feeder/view/camerascreen/camera_screen.dart';
import 'package:smart_pet_feeder/view/homescreen/home_screen.dart';
import 'package:smart_pet_feeder/view/layout/layout_screen.dart';
import 'package:smart_pet_feeder/view/login/login_screen.dart';
import 'package:smart_pet_feeder/view/objectdetection/objectdetection_screen.dart';
import 'package:smart_pet_feeder/view/schedulecreatescreen/schedulecreate_screen.dart';
import 'package:smart_pet_feeder/view/schedulerscreen/scheduler_screen.dart';
import 'package:smart_pet_feeder/view/splash_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RouteName.splashScreen,
          page: () => SplashScreen(),
          transitionDuration: Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.loginScreen,
          page: () => LoginScreen(),
          transitionDuration: Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.signupScreen,
          page: () => SignupScreen(),
          transitionDuration: Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.homescreen,
          page: () => HomeScreen(),
          transitionDuration: Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.objectdetectionscreen,
          page: () => ObjectDetectionScreen(),
          transitionDuration: Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.schedulerscreen,
          page: () => SchedulerScreen(),
          transitionDuration: Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.layoutscreen,
          page: () => LayoutScreen(),
          transitionDuration: Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.camerascreen,
          page: () => CameraScreen(),
          transitionDuration: Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.schedulecreatescreen,
          page: () => ScheduleCreateScreen(),
          transitionDuration: Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
       
      ];
}
