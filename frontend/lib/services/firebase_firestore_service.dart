import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<String>?> getCategories() async {
    final document = _firestore.collection('AppData').doc('AppData');
    final snapshot = await document.get();

    if (!snapshot.exists) {
      return null;
    }
    final data = snapshot.data();
    return List<String>.from(data!['Categories'] as List<dynamic>);
  }

  Future<List<String>?> getDuration() async {
    final document = _firestore.collection('AppData').doc('AppData');
    final snapshot = await document.get();

    if (!snapshot.exists) {
      return null;
    }
    final data = snapshot.data();
    return List<String>.from(data!['Duration'] as List<dynamic>);
  }

  Future<List<String>?> getDurationTypes() async {
    final document = _firestore.collection('AppData').doc('AppData');
    final snapshot = await document.get();

    if (!snapshot.exists) {
      return null;
    }
    final data = snapshot.data();
    return List<String>.from(data!['Duration Types'] as List<dynamic>);
  }

  Future<List<String>?> getPaidBy() async {
    final document = _firestore.collection('AppData').doc('AppData');
    final snapshot = await document.get();

    if (!snapshot.exists) {
      return null;
    }
    final data = snapshot.data();
    return List<String>.from(data!['Paid By'] as List<dynamic>);
  }
}