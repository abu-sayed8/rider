import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rider_app/main.dart';
import 'package:rider_app/pages/home.dart';
import 'package:rider_app/pages/login_page.dart';
import 'package:rider_app/widgets/buttons.dart';
import 'package:rider_app/widgets/message.dart';
class Registration extends StatefulWidget {
  static const String idScreen="registration";
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController nameTextEditingController=TextEditingController();
  TextEditingController emailTextEditingController=TextEditingController();
  TextEditingController phoneTextEditingController=TextEditingController();
  TextEditingController passwordTextEditingController=TextEditingController();

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
                    controller: nameTextEditingController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'Name',
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
                    controller: emailTextEditingController,
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
                    controller: phoneTextEditingController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        labelText: 'Phone',
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
                    controller: passwordTextEditingController,
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
                      child: mButton(context, 'Create Account'),
                      onTap:() {
                        if(nameTextEditingController.text.length<3 ){
                          toastMessages(context, "Name must be atleast 3 character.");
                        }
                        else if(!emailTextEditingController.text.contains('@'))
                          {
                            toastMessages(context, "Email address is not Valid.");
                          }
                        else if(phoneTextEditingController.text.isEmpty)
                          {
                            toastMessages(context, "Phone number is mandatory");
                          }
                        else if(passwordTextEditingController.text.length<6)
                          {
                            toastMessages(context, "Password must be atleast 6 Character.");
                          }
                        else{
                          registerNewUser(context);
                        }

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
                    Login.idScreen, (route) => false);
              },
              // onTap: (){
              //   Navigator.of(context).push(
              //       MaterialPageRoute (builder: (context)=>Login())
              //   );
              // },
              child: Container(
                margin: EdgeInsets.only(left: 10,right: 10),
                child: Text(
                  'Already have an Account? Login here',
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
  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
  void registerNewUser(BuildContext context)async{
    final User firebaseUser=(
        await _firebaseAuth
        .createUserWithEmailAndPassword(
            email: emailTextEditingController.text,
            password: passwordTextEditingController.text
        ).catchError((errMsg){
          toastMessages(context, "Error: "+ errMsg.toString());
        })
    ).user;
    if(firebaseUser !=null)
      {

        Map userDataMap={
          "name":nameTextEditingController.text.trim(),
          "email":emailTextEditingController.text.trim(),
          "phone":phoneTextEditingController.text.trim(),
        };
        usersRef.child(firebaseUser.uid).set(userDataMap);
        toastMessages(context, "Congratulations, your account has been created");
        Navigator.pushNamedAndRemoveUntil(
            context, Home.idScreen, (route) => false);
      }
    else{
      toastMessages(context, 'New user account has not been Created');
    }
  }
}
