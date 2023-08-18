import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyA457tQIBjQQ0CzUYyJHmntFg9qJGJqGdI",
            authDomain: "santecorpsesprit-cdd97.firebaseapp.com",
            projectId: "santecorpsesprit-cdd97",
            storageBucket: "santecorpsesprit-cdd97.appspot.com",
            messagingSenderId: "128983869231",
            appId: "1:128983869231:web:d3ded44e5540b46d9ba3da"));
  } else {
    await Firebase.initializeApp();
  }
}
