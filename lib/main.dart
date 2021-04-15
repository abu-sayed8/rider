import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:rider_app/pages/home.dart';
import 'package:rider_app/pages/login_page.dart';
import 'package:rider_app/pages/registration.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
DatabaseReference usersRef=FirebaseDatabase.instance.reference().child("users");

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rider App',
      theme: ThemeData(
        fontFamily: "Brand Bold",
        //fontFamily: "Signatra",
        primarySwatch: Colors.blue,
      ),
      initialRoute: Login.idScreen,
      routes: {
        Registration.idScreen:(context)=>Registration(),
        Login.idScreen:(context)=>Login(),
        Home.idScreen:(context)=>Home(),
      },
      debugShowCheckedModeBanner: false,
      //home: HomePage(),
    );
  }
}
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Login(),
//     );
//   }
// }

