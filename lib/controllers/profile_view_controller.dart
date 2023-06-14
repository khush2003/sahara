import 'package:get/get.dart';

class CustomTabController extends GetxController {
  final isGiveSelected = true.obs;
  final isReceiveSelected = false.obs;
  final isNewSelected = true.obs;
  final isHistorySelected = false.obs;

  void selectNew() {
    isNewSelected.value = true;
    isHistorySelected.value = false;
  }

  void selectHistory() {
    isHistorySelected.value = true;
    isNewSelected.value = false;
  }

  void selectGive() {
    isGiveSelected.value = true;
    isReceiveSelected.value = false;
  }

  void selectReceive() {
    isGiveSelected.value = false;
    isReceiveSelected.value = true;
  }
}
