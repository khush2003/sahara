import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahara/theme/app_theme.dart';

enum DeliveryStatus { inTransit, toDeliver, toReceive, delivered }

DeliveryStatus convertDeliveryStatusFromString(String deliveryStatus) {
  switch (deliveryStatus) {
    case 'inTransit':
      return DeliveryStatus.inTransit;
    case 'toDeliver':
      return DeliveryStatus.toDeliver;
    case 'toReceive':
      return DeliveryStatus.toReceive;
    case 'delivered':
      return DeliveryStatus.delivered;
    default:
      return DeliveryStatus.toDeliver;
  }
}

String convertDeliveryStatusToString(DeliveryStatus deliveryStatus) {
  switch (deliveryStatus) {
    case DeliveryStatus.inTransit:
      return 'inTransit';
    case DeliveryStatus.toDeliver:
      return 'toDeliver';
    case DeliveryStatus.toReceive:
      return 'toReceive';
    case DeliveryStatus.delivered:
      return 'delivered';
    default:
      return 'toDeliver';
  }
}

enum DeliveryPaidBy { donor, receiver, both }

DeliveryPaidBy convertFromString(String deliveryPaidBy) {
  switch (deliveryPaidBy) {
    case 'donor':
      return DeliveryPaidBy.donor;
    case 'receiver':
      return DeliveryPaidBy.receiver;
    case 'both':
      return DeliveryPaidBy.both;
    default:
      return DeliveryPaidBy.donor;
  }
}

String convertToString(DeliveryPaidBy deliveryPaidBy) {
  switch (deliveryPaidBy) {
    case DeliveryPaidBy.donor:
      return 'donor';
    case DeliveryPaidBy.receiver:
      return 'receiver';
    case DeliveryPaidBy.both:
      return 'both';
    default:
      return 'donor';
  }
}

String formatDate(DateTime date) {
  String month;
  switch (date.month) {
    case 1:
      month = 'January';
      break;
    case 2:
      month = 'February';
      break;
    case 3:
      month = 'March';
      break;
    case 4:
      month = 'April';
      break;
    case 5:
      month = 'May';
      break;
    case 6:
      month = 'June';
      break;
    case 7:
      month = 'July';
      break;
    case 8:
      month = 'August';
      break;
    case 9:
      month = 'September';
      break;
    case 10:
      month = 'October';
      break;
    case 11:
      month = 'November';
      break;
    case 12:
      month = 'December';
      break;
    default:
      month = 'January';
      break;
  }
  String formattedDate =
      "${date.day.toString().padLeft(2, '0')}-$month-${date.year}";
  return formattedDate;
}

String formatDuration(Duration duration) {
  int days = duration.inDays;
  return '$days ${days == 1 ? 'day' : 'days'}';
}

bool checkEmail(String input) {
  RegExp regex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
      caseSensitive: false);
  return regex.hasMatch(input);
}

void normalSnackBar(String titleText, String message, Color? backgroundColor,
    Color? textColor) {
  Get.snackbar(
    "Success",
    message,
    snackPosition: SnackPosition.BOTTOM,
    colorText: textColor ?? Colors.white,
    backgroundColor: backgroundColor ?? Colors.green,
    margin: const EdgeInsets.all(16),
    padding: const EdgeInsets.all(16),
    borderRadius: 8,
    duration: const Duration(seconds: 3),
    snackStyle: SnackStyle.FLOATING,
    shouldIconPulse: true,
    titleText: Text(
      titleText,
      style: headTextBold(),
    ),
    messageText: Text(
      message,
      style: regularTextBold(color: textColor ?? Colors.white),
    ),
  );
}

void successSnackBar(String message, {int durationSeconds = 3}) {
  Get.snackbar(
    "Success",
    message,
    snackPosition: SnackPosition.BOTTOM,
    colorText: Colors.white,
    backgroundColor: Colors.green,
    margin: const EdgeInsets.all(16),
    padding: const EdgeInsets.all(16),
    borderRadius: 8,
    duration:  Duration(seconds: durationSeconds),
    snackStyle: SnackStyle.FLOATING,
    shouldIconPulse: true,
    titleText: Text(
      "Success",
      style: headTextBold(),
    ),
    messageText: Text(
      message,
      style: regularTextBold(color: Colors.white),
    ),
  );
}

void warningSnackBar(String message) {
  Get.snackbar(
    "Warning",
    message,
    snackPosition: SnackPosition.BOTTOM,
    colorText: Colors.white,
    backgroundColor: Colors.orange,
    margin: const EdgeInsets.all(16),
    padding: const EdgeInsets.all(16),
    borderRadius: 8,
    duration: const Duration(seconds: 3),
    snackStyle: SnackStyle.FLOATING,
    shouldIconPulse: true,
    titleText: Text(
      "Warning",
      style: headTextBold(),
    ),
    messageText: Text(
      message,
      style: regularTextBold(color: Colors.white),
    ),
  );
}

void errorSnackBar(String message) {
  Get.snackbar(
    "Error",
    message,
    snackPosition: SnackPosition.BOTTOM,
    colorText: Colors.white,
    backgroundColor: Colors.red,
    margin: const EdgeInsets.all(16),
    padding: const EdgeInsets.all(16),
    borderRadius: 8,
    duration: const Duration(seconds: 3),
    snackStyle: SnackStyle.FLOATING,
    shouldIconPulse: true,
    titleText: Text(
      "Error",
      style: headTextBold(),
    ),
    messageText: Text(
      message,
      style: regularTextBold(color: Colors.white),
    ),
  );
}

String getAuthErrorMessage(String errorCode) {
  switch (errorCode) {
    // Sign in errors
    case "invalid-email":
      return "Invalid email address. Please check your input and try again.";
    case "wrong-password":
      return "Incorrect password. Please try again.";
    case "user-not-found":
      return "This email address is not associated with an account. Please sign up first.";
    case "user-disabled":
      return "This account has been disabled. Please contact support for assistance.";
    case "too-many-requests":
      return "Too many requests. Please try again later.";
    case "operation-not-allowed":
      return "This operation is not allowed. Please try again later.";
    case "weak-password":
      return "Your password is too weak. Please choose a stronger password.";
    // Sign up errors
    case "email-already-in-use":
      return "This email address is already in use. Please sign in or use a different email address.";
    case "invalid-credential":
      return "Invalid credentials. Please check your input and try again.";
    case "invalid-verification-code":
      return "Invalid verification code. Please check your input and try again.";
    case "invalid-verification-id":
      return "Invalid verification ID. Please check your input and try again.";
    case "phone-number-already-exists":
      return "This phone number is already in use. Please sign in or use a different phone number.";
    case "quota-exceeded":
      return "Quota exceeded. Please try again later.";
    case "provider-already-linked":
      return "This provider is already linked to this account. Please sign in or use a different provider.";
    default:
      return "An unknown error occurred. Please try again later.";
  }
}
