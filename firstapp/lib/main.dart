import 'package:firebase_core/firebase_core.dart';
import 'package:firstapp/View/login_view.dart';
import 'package:firstapp/View/register_view.dart';
import 'package:firstapp/View/verify_email_view.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      debugShowCheckedModeBanner: false,
      home: const VerifyEmailView(),
      //routes: {
      //'/login/': (context) => const Loginview(),
      //'/register/': (context) => const RegisterView(),
      //},
    ),
  );
}

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            //final user = FirebaseAuth.instance.currentUser;
            //if (user?.emailVerified ?? false) {
            // return const Text('Done');
            //} else {
            //return const VerifyEmailView();
            // }
            return const Loginview();
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
