import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

toastMessages(BuildContext context,String message){
  return Fluttertoast.showToast(
    msg : message,
  );
}
void showLoadingDialog(BuildContext context, var loadingMgs) {
   showDialog(
      barrierDismissible: false,
      context: context,
      builder:(context){
        return AlertDialog(
          content: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 20),
              Expanded(child: Text(loadingMgs,
                  style: TextStyle(fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700]))),
            ],
          ),
        );
      }
  );
}