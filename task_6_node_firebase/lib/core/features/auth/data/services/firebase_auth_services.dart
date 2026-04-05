// ignore_for_file: await_only_futures, unnecessary_nullable_for_final_variable_declarations

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:task_6_node_firebase/core/features/auth/data/models/user_data_class.dart';

class FirebaseAuthServices {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  static Future<String?> signInWithGoogle() async {
    try {
      await _googleSignIn.initialize(
        clientId:
            '1022135696411-kpn8g1913u3ghhhth4hgd704tlhr40kk.apps.googleusercontent.com',
        serverClientId:
            '1022135696411-kpn8g1913u3ghhhth4hgd704tlhr40kk.apps.googleusercontent.com',
      );

      await _googleSignIn.signOut();

      final GoogleSignInAccount? googleUser = await _googleSignIn
          .authenticate();

      if (googleUser == null) return "تم إلغاء عملية الدخول";

      final auth = await googleUser.authentication;
      final client = await googleUser.authorizationClient.authorizeScopes([
        'email',
        'profile',
      ]);
      final String? accessToken = client.accessToken;

      if (auth.idToken == null || accessToken == null) {
        return "فشل الحصول على رموز المصادقة";
      }

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: auth.idToken,
        accessToken: accessToken,
      );

      await _auth.signInWithCredential(credential);
      UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );
      User? user = userCredential.user;

      if (user != null) {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'uid': user.uid,
          'email': user.email,
          'displayName': user.displayName,
          'photoURL': user.photoURL,
          'lastLogin': FieldValue.serverTimestamp(),
        }, SetOptions(merge: true));
      }
      return "Success";
    } on GoogleSignInException catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled) {
        return "تم إلغاء تسجيل الدخول بواسطة المستخدم";
      }
      return "خطأ في جوجل: ${e.code}";
    } catch (e) {
      debugPrint("General Error: $e");
      return "حدث خطأ غير متوقع: $e";
    }
  }

  static Future<String?> signUp(UserDataClass data) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: data.email,
        password: data.password,
      );

      if (data.username != null) {
        await credential.user?.updateDisplayName(data.username);
      }

      return "Success";
    } on FirebaseAuthException catch (e) {
      return _handleAuthError(e);
    } catch (e) {
      return "حدث خطأ غير متوقع";
    }
  }

  static Future<String?> signIn(UserDataClass data) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: data.email,
        password: data.password,
      );
      return "Success";
    } on FirebaseAuthException catch (e) {
      return _handleAuthError(e);
    } catch (e) {
      return "حدث خطأ غير متوقع";
    }
  }

  // lib/core/features/auth/data/services/firebase_auth_services.dart

  static Future<void> signOut() async {
    try {
      await _googleSignIn.signOut().timeout(
        const Duration(seconds: 1),
        onTimeout: () => null,
      );
    } catch (e) {
      debugPrint("Google Sign Out Error: $e");
    }

    await _auth.signOut();
  }

  static String _handleAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return "هذا البريد الإلكتروني مستخدم بالفعل";
      case 'weak-password':
        return "كلمة المرور ضعيفة جداً";
      case 'user-not-found':
      case 'invalid-credential':
        return "تأكد من البريد الإلكتروني أو كلمة المرور";
      case 'invalid-email':
        return "البريد الإلكتروني غير صالح";
      case 'network-request-failed':
        return "تحقق من اتصالك بالإنترنت";
      default:
        return e.message ?? "حدث خطأ في المصادقة";
    }
  }
}
