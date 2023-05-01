


import 'package:course_app/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

 appMessage({required String text}){


  Get.snackbar("   $text ", '',
      icon:const Icon(Icons.app_shortcut,color:ColorsManager.white,size:33,)
  );
}