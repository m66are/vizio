import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:vizio/constants/theme.dart';
import 'package:vizio/controllers/AuthController.dart';
import 'package:vizio/controllers/DataController.dart';
import 'package:vizio/routes/routes.dart';

class Runner extends StatefulWidget {
  const Runner({super.key});

  @override
  State<Runner> createState() => _RunnerState();
}

class _RunnerState extends State<Runner> {
  @override
  void initState() {
    Get.put(AuthController(), permanent: true);
    Get.put(DataController(), permanent: true);

    super.initState();
  }

  @override
  void dispose() {
    Get.delete<AuthController>();
    Get.delete<DataController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return Sizer(builder: (context, _, __) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        routes: mainRoutes,
        theme: MyThemes.lightTheme,
      );
    });
  }
}
