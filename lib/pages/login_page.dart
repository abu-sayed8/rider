import 'package:flutter/material.dart';
import 'package:rider_app/pages/registration.dart';
import 'package:rider_app/widgets/buttons.dart';
class Login extends StatefulWidget {
  static const String idScreen="login";
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 10,right: 10),
        child: ListView(
          children: [
            SizedBox(height: size.height*.06,),
            Image(image: AssetImage("asset/images/logo.png"),
            height: size.height*0.3,
            width: size.height*0.5,
              alignment: Alignment.center,
            ),
            SizedBox(height: 1,),
            Text('Login as a Rider',
            style: TextStyle(fontSize: size.height*.03,fontFamily: 'Brand Bold'),
              textAlign: TextAlign.center,
            ),
            Padding(padding: EdgeInsets.all(size.height*.01),
            child: Column(
              children: [
                SizedBox(height: 1,),
                TextField(
                  // key: for,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: size.height*.018
                      )
                  ),
                  style: TextStyle(
                      fontSize: size.height*.022
                  ),
                ) ,
                SizedBox(height: 1,),
                TextField(
                  // key: for,
                  //keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: size.height*.018
                      )
                  ),
                  style: TextStyle(fontSize: size.height*.022),
                ),
                SizedBox(height: 10,) ,
                GestureDetector(
                    child: mButton(context, 'Login'),
                onTap:() {
                      print('login now');
                }
                // {
                //   Navigator.of(context).push(
                //       MaterialPageRoute(builder: (context) {
                //         print('Loggin now');
                //   }));
                // },

                ),
              ],
            ),
            ),
            SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                Navigator.pushNamedAndRemoveUntil(context,
                    Registration.idScreen, (route) => false);
              },

              // onTap: (){
              //   Navigator.of(context).push(
              //       MaterialPageRoute (builder: (context)=>Registration())
              //   );
              // },
              child: Container(
                margin: EdgeInsets.only(left: 10,right: 10),
                child: Text(
                  'Do not have an Account? Register now',
                  style: TextStyle(fontSize: size.height*.022),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
