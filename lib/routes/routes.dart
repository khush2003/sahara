import 'package:get/get.dart';
import 'package:sahara/views/FirstVisitPages/forgot_password_view.dart';
import 'package:sahara/views/FirstVisitPages/onboarding_view.dart';
import 'package:sahara/views/SettingPages/change_address_view.dart';
import 'package:sahara/views/SettingPages/change_password_view.dart';
import 'package:sahara/views/SettingPages/change_phone_number_view.dart';
import 'package:sahara/views/SettingPages/change_username_view.dart';
import 'package:sahara/views/app.dart';
import 'package:sahara/views/coupon_view.dart';
import 'package:sahara/views/create_donation.dart';
import 'package:sahara/views/donation_item_details.dart';
import 'package:sahara/views/payment_page.dart';
import 'package:sahara/views/FirstVisitPages/login_view.dart';
import 'package:sahara/views/SettingPages/profile_setting_view.dart';
import 'package:sahara/views/FirstVisitPages/register_view.dart';
import 'package:sahara/views/chat.dart';
import 'package:sahara/views/delivery.dart';
import 'package:sahara/views/feed.dart';
import 'package:sahara/views/test_note.dart';
import 'package:sahara/views/notifications.dart';
import 'package:sahara/views/profile.dart';
import 'package:sahara/views/what_is_view.dart';
import 'package:sahara/views/help.dart';

import '../views/block_users.dart';
import '../views/boarding.dart';
import '../views/profile_view.dart';
import '../views/review_page.dart';
import '../views/review_post_details.dart';

abstract class Routes {
  static const String delivery = '/delivery';
  static const String feed = '/feed';
  static const String profile = '/profile';
  static const String testNote = '/testNote';
  static const String notifications = '/notifications';
  static const String chat = '/chat';
  static const String profileView = '/profileview';
  static const String blockUsers = '/blockUsers';
  static const String login = '/login';
  static const String register = '/register';
  static const String whatIs = '/whatIs';
  static const String onboarding = '/onboarding';
  static const String review = '/review';
  static const String help = '/help';
  static const String createDonation = '/createDonation';
  static const String payment = '/payment';
  static const String donationDetails = '/donationDetails';
  static const String reviewDetails = '/reviewDetails';
  static const String profileSetting = '/profileSetting';
  static const String changeUsername = '/changeUsername';
  static const String changePhoneNumber = '/changePhoneNumber';
  static const String changeAddress = '/changeAddress';
  static const String changePassword = '/changePassword';
  static const String coupon = '/coupon';
  static const String forgotPass = '/forgotPass';
  static const String app = '/app';
}

final getPages = [
  GetPage(name: Routes.delivery, page: () => DeliveryView()),
  GetPage(name: Routes.feed, page: () => FeedView()),
  GetPage(name: Routes.profile, page: () => const Profile()),
  GetPage(name: Routes.testNote, page: () => TestNote()),
  GetPage(name: Routes.createDonation, page: () => CreateDonation()),
  GetPage(name: Routes.notifications, page: () => const NotificationsView()),
  GetPage(name: Routes.chat, page: () => const ChatView()),
  GetPage(name: Routes.profileView, page: () => ProfileView()),
  GetPage(name: Routes.blockUsers, page: () => BlockUsers()),
  GetPage(name: Routes.login, page: () => const LoginView()),
  GetPage(name: Routes.register, page: () => RegisterView()),
  GetPage(name: Routes.whatIs, page: () => WhatIsView()),
  GetPage(name: Routes.onboarding, page: () => OnBoardingView()),
  GetPage(name: Routes.review, page: () => ReviewPage()),
  GetPage(name: Routes.help, page: () => Help()),
  GetPage(name: Routes.donationDetails, page: () => DonationItemDetailsView()),
  GetPage(name: Routes.payment, page: () => PaymentPage()),
  GetPage(name: Routes.reviewDetails, page: () => ReviewPostDetailsView()),
  GetPage(name: Routes.donationDetails, page: () => DonationItemDetailsView()),
  GetPage(name: Routes.profileSetting, page: () => ProfileSettingView()),
  GetPage(name: Routes.changeUsername, page: () => ChangeUsernameView()),
  GetPage(name: Routes.changePhoneNumber, page: () => ChangePhoneNumberView()),
  GetPage(name: Routes.changeAddress, page: () => ChangeAddressView()),
  GetPage(name: Routes.changePassword, page: () => ChangePasswordView()),
  GetPage(name: Routes.coupon, page: () => CouponView()),
  GetPage(name: Routes.forgotPass, page: () => ForgotPassView()),
  GetPage(name: Routes.app, page: () => App())
];
