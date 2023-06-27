import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sahara/models/user.dart';
import 'package:sahara/rest_api.dart';

import 'auth/auth_controller.dart';

class BlockUsersController extends GetxController {
  List<BlockedUser> blockedUsers = <BlockedUser>[].obs;
  static BlockUsersController get instance => Get.find<BlockUsersController>();
  final connect = Get.find<GetConnect>();
  final restApi = RestAPI.instance;
  final imageUrl = ''.obs;
  final isGiveSelected = true.obs;
  final isReceiveSelected = false.obs;
  final isNewSelected = true.obs;
  final isHistorySelected = false.obs;

  Rx<UserSahara?> user = Rx<UserSahara?>(null);

  @override
  void onInit() {
    super.onInit();
    getUserById();
    getBlockedUsersDetails();
  }

  void getUserById() async {
    UserSahara? fetchedUser =
        await restApi.getUserById(FirebaseAuth.instance.currentUser!.uid);
    if (fetchedUser != null) {
      user.value = fetchedUser;
      //print(AuthController.instance.userSahara.value.blockedUser);
    } else {
      print("User not found");
    }
  }

  void getBlockedUsersDetails() async {
    List<String> blockedUserIds = user.value!.blockedUser ?? [];
    blockedUsers.clear();

    for (String userId in blockedUserIds) {
      UserSahara? blockedUser = await restApi.getUserById(userId);
      if (blockedUser != null) {
        BlockedUser blockedUserData = BlockedUser(
          userId: userId,
          userName: blockedUser.userName,
          profilePicture: blockedUser.profilePicture ??
              'https://t4.ftcdn.net/jpg/04/83/90/95/360_F_483909569_OI4LKNeFgHwvvVju60fejLd9gj43dIcd.jpg',
        );
        blockedUsers.add(blockedUserData);
      }
    }
    print(AuthController.instance.userSahara.value.blockedUser);
  }
}

class BlockedUser {
  final String userId;
  final String userName;
  final String profilePicture;

  BlockedUser({
    required this.userId,
    required this.userName,
    required this.profilePicture,
  });
}
