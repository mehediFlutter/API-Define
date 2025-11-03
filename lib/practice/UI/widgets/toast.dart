import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

class PToast{
  static successToast(String successMessage){
    showToast(
      successMessage,
      dismissOtherToast: true,
      position: ToastPosition.bottom,
      backgroundColor: Colors.green,
      duration: Duration(seconds: 1),
      radius: 8

    );
  }
  static errorToast(String errorMessage){
    showToast(
      errorMessage,
      dismissOtherToast: true,
      position: ToastPosition.bottom,
      backgroundColor: Colors.red,
      duration: Duration(seconds: 1),
      radius: 8

    );
  }
}