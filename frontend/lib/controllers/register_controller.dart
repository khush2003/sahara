import 'package:firebase_auth/firebase_auth.dart';
import 'package:sahara/rest_api.dart';
import 'package:get/get.dart';


class RegisterController extends GetxController {
  final restApi = RestAPI.instance;
  static RegisterController get instance => Get.find();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Not finished YET!! Don't change anything!!!!


  void sendDataToFirestore() async {
  dynamic result = await restApi.postUserInfo();
  if (result != null) {
    // Success, handle the response data
    print('Data sent successfully: $result');
  } else {
    // Error, handle the failure
    print('Failed to send data');
  }
}



void authStateChanges() {
  FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });
}

void createUserWithEmailAndPassword() async{
try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: "emailAddress",
    password: "",
  );
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}
}
}