import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseFirestoreServices {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  static Future<void> createUser(User user, String username) async {
    try {
      await _db.collection('users').doc(user.uid).set({
        'uid': user.uid,
        'username': username,
        'email': user.email,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      debugPrint("Firestore Error: $e");
      rethrow;
    }
  }

  static Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _db.collection('users').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id;
        return data;
      }).toList();
    });
  }

  static Future<DocumentSnapshot> getUserData(String uid) async {
    return await _db.collection('users').doc(uid).get();
  }
}
