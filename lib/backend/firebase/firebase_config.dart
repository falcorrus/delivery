import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCd5O26xEl80YBX_uh_Xe-nxcfv2y70a9U",
            authDomain: "happygo-prod.firebaseapp.com",
            projectId: "happygo-prod",
            storageBucket: "happygo-prod.appspot.com",
            messagingSenderId: "405573195235",
            appId: "1:405573195235:web:0f14022790c99a4bfdfcd6",
            measurementId: "G-NL0RZZQWXM"));
  } else {
    await Firebase.initializeApp();
  }
}
