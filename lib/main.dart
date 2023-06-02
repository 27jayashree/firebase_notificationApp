
import 'package:flutter/material.dart';
import 'package:lastfirebasedatabase/responsive.dart';
import 'simpleui.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart' show kIsWeb;


/*---------------push notification message start 28-11-2022----------------*/
Future<void> backroundHandler(RemoteMessage message) async {
  print(" This is message from background");
  print(message.notification!.title);
  print(message.notification!.body);
}
/*---------------push notification message end 28-11-2022----------------*/

 void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCgMAF1B1VAWIg-32o4x17YxQDE6DxcuTE",
            authDomain: "lastfirebasedatabase.firebaseapp.com",
            projectId: "lastfirebasedatabase",
            storageBucket: "lastfirebasedatabase.appspot.com",
            messagingSenderId: "431135699336",
            appId: "1:431135699336:web:1a97abd2782928df75ca3d",
            measurementId: "G-88Z8YTQKRN"
        )
    );
    FirebaseMessaging.onBackgroundMessage(backroundHandler);
  }
  else {
    await Firebase.initializeApp();
    FirebaseMessaging.onBackgroundMessage(backroundHandler);
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Responsive(
          mobile: SharedPreference(title: 'Shared Location',),
          tablet: Center(
            child: Container(
              width: 400,
              child: SharedPreference(title: 'Shared Location',),
            ),
          ),
          desktop: Center(
            child: Container(
              width: 400,
              child:SharedPreference(title: 'Shared Location',),
            ),
          ),
        )
    );
  }
}







