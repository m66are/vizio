import 'package:flutter/material.dart';
import 'package:vizio/views/HomeView/HomeView.dart';
import 'package:vizio/views/InfoView/InfoView.dart';
import 'package:vizio/views/LoginView/LoginView.dart';
import 'package:vizio/views/SignUpView/SignUpView.dart';
import 'package:vizio/views/Wrapper.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

const String kWrapper = "/";
const String kHomeRoute = "/home";
const String kLoginRoute = "/login";
const String kSignUpRoute = "/signUp";
const String kInfo = "/info";

Map<String, Widget Function(BuildContext)> mainRoutes = {
  kWrapper: (context) => const Wrapper(),
  kHomeRoute: (context) => const HomeView(),
  kLoginRoute: (context) => const LoginView(),
  kSignUpRoute: (context) => const SignUpView(),
  kInfo: (context) => const InfoView(),
};
