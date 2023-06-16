import 'package:get/get.dart';
import 'package:sahara/views/login_view.dart';
import 'package:sahara/views/onboarding_view.dart';
import 'package:sahara/views/register_view.dart';
import 'package:sahara/views/test_fai.dart';
import 'package:sahara/views/test_james.dart';
import 'package:sahara/views/test_khush.dart';
import 'package:sahara/views/test_note.dart';
import 'package:sahara/views/test_poln.dart';
import 'package:sahara/views/test_ulyssus.dart';
import 'package:sahara/views/profile.dart';
import 'package:sahara/views/whatIs_view.dart';

import '../views/block_users.dart';
import '../views/boarding.dart';
import '../views/profile_view.dart';
import '../views/review_page.dart';

abstract class Routes {
  static const String boarding = '/boarding';
  static const String testJames = '/testJames';
  static const String testKhush = '/testKhush';
  static const String profile = '/profile';
  static const String testNote = '/testNote';
  static const String testPoln = '/testPoln';
  static const String testFai = '/testFai';
  static const String profileView = '/profileview';
  static const String blockUsers = '/blockUsers';
  static const String login = '/login';
  static const String register = '/register';
  static const String whatIs = '/whatIs';
  static const String onboarding = '/onboarding';
  static const String review = '/review';
}

final getPages = [
  GetPage(name: Routes.boarding, page: () => const BoardingView()),
  GetPage(name: Routes.testJames, page: () => TestJames()),
  GetPage(name: Routes.testKhush, page: () => TestKhush()),
  GetPage(name: Routes.profile, page: () => const Profile()),
  GetPage(name: Routes.testNote, page: () => TestNote()),
  GetPage(name: Routes.testPoln, page: () => const TestPoln()),
  GetPage(name: Routes.testFai, page: () => const TestFai()),
  GetPage(name: Routes.profileView, page: () => ProfileView()),
  GetPage(name: Routes.blockUsers, page: () => BlockUsers()),
  GetPage(name: Routes.login, page: () => const LoginView()),
  GetPage(name: Routes.register, page: () => RegisterView()),
  GetPage(name: Routes.whatIs, page: () => WhatIs()),
  GetPage(name: Routes.onboarding, page: () => OnBoarding()),
  GetPage(name: Routes.review, page: ()=> ReviewPage())
];
