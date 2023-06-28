import 'package:get/get.dart';
import 'package:sahara/controllers/auth/auth_controller.dart';

import '../rest_api.dart';

class DependencyInjection {
  static void init() async {
    Get.put<GetConnect>(GetConnect()); //initializing GetConnect
    Get.put<RestAPI>(RestAPI()); //initializing RestAPI
    RestAPI.instance.onInit(); //initializing RestAPI
    Get.put<AuthController>(AuthController());
  }
}
