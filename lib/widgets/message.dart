import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

toastMessages(BuildContext context,String message){
  return Fluttertoast.showToast(
    msg : message
  );
}