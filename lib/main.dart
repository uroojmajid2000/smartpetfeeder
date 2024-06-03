import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_pet_feeder/res/getx_loclization/languages.dart';
import 'package:smart_pet_feeder/res/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SMART PET FEEDER',
      // translations: Languages(),
      // locale: const Locale('en', 'US'),
      // fallbackLocale: const Locale('en', 'US'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: AppRoutes.appRoutes(),
    );
  }
}
