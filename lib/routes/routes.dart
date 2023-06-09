import 'package:get/get.dart';
import 'package:sahara/views/test_fai.dart';
import 'package:sahara/views/test_james.dart';
import 'package:sahara/views/test_khush.dart';
import 'package:sahara/views/test_note.dart';
import 'package:sahara/views/test_poln.dart';
import 'package:sahara/views/test_ulyssus.dart';

import '../views/boarding.dart';

abstract class Routes {
  static const String boarding = '/boarding';
  static const String testJames = '/testJames';
  static const String testKhush = '/testKhush';
  static const String testUlyssus = '/testUlyssus';
  static const String testNote = '/testNote';
  static const String testPoln = '/testPoln';
  static const String testFai = '/testFai';
}

final getPages = [
  GetPage(name: Routes.boarding, page: () => const BoardingView()),
  GetPage(name: Routes.testJames, page: () => const TestJames()),
  GetPage(name: Routes.testKhush, page: () => const TestKhush()),
  GetPage(name: Routes.testUlyssus, page: () => const TestUlyssus()),
  GetPage(name: Routes.testNote, page: () => const TestNote()),
  GetPage(name: Routes.testPoln, page: () => const TestPoln()),
  GetPage(name: Routes.testFai, page: () => const TestFai()),
];
