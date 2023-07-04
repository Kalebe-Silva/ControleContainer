import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBPLDhMy-KRpmZbR2ccWuGohFZf84zDmwQ",
            authDomain: "layout1-a6625.firebaseapp.com",
            projectId: "layout1-a6625",
            storageBucket: "layout1-a6625.appspot.com",
            messagingSenderId: "818914386785",
            appId: "1:818914386785:web:3050e7006264d4dc8e9b20"));
  } else {
    await Firebase.initializeApp();
  }
}
