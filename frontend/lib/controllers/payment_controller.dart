import 'package:get/get.dart';
import 'package:sahara/controllers/auth/auth_controller.dart';
import 'package:sahara/models/donation_item.dart';
import 'package:sahara/rest_api.dart';

class PaymentController extends GetxController {
  final Rx<DonationItem> item = DonationItem.test().obs;
  final auth = AuthController.instance;
  final _restApi = RestAPI.instance;
  
}
