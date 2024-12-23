import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBszc4BNx3fYUWHpbJXC5bfYPhrDZ8m0mc",
            authDomain: "yummy-dish-p42cvq.firebaseapp.com",
            projectId: "yummy-dish-p42cvq",
            storageBucket: "yummy-dish-p42cvq.firebasestorage.app",
            messagingSenderId: "856969684837",
            appId: "1:856969684837:web:928a9d49ca8ad88f38e38c"));
  } else {
    await Firebase.initializeApp();
  }
}
