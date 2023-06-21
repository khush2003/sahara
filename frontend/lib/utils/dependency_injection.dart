import 'package:get/get.dart';

import '../rest_api.dart';

class DependencyInjection {
 static void init() async {
   Get.put<GetConnect>(GetConnect()); //initializing GetConnect
   Get.put<RestAPI>(RestAPI()); //initializing RestAPI
 }
}