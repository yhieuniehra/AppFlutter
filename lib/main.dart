import 'package:flutter/material.dart';
import 'screens/sign_in_screen.dart';
import 'screens/sign_up_screen.dart';
import 'screens/profile_setup_screen.dart';
// import 'screens/mystripapp.dart';
// import 'screens/explore.dart';
// import 'screens/chat.dart';
import 'screens/navigator.dart';
import 'screens/TripInformationScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: SignInScreen(),
      routes: {
        '/sign_in': (context) => SignInScreen(),
        '/sign_up': (context) => SignUpScreen(),
        '/profile_setup': (context) => CompleteProfileScreen(),
        '/navigation': (context) => BottomNavigationBarExampleApp(),
        '/tripinfo': (context) => TripInformationScreen(),

        // '/mystripapp': (context) => MyTripApp(),
        // '/explore': (context) => Explore(),
        // 'chatscreen':(context) => ChatScreen(),
      },
    );
  }
}
