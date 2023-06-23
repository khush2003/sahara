import 'package:get/get.dart';

class NavBarController extends GetxController {
  final _selectedIndex = 0.obs;

  int get selectedIndex => _selectedIndex.value;

  void changeIndex(int index) {
    _selectedIndex(index);
  }
}
