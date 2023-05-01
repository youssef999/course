import 'package:bloc/bloc.dart';
import 'package:course_app/presentation/views/Home/home_view.dart';
import 'package:course_app/presentation/views/auth/login_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'bloc_obs.dart';

void main()async {
  Bloc.observer = MyBlocObserver();
  await GetStorage.init();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

 class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    final box=GetStorage();
    String email = box.read('email')??'x';

    if(email=='x'){
      return const GetMaterialApp(
          title: 'App',
          debugShowCheckedModeBanner: false,
          home :
          UserLoginView()
      );
    }

    else{

      return const GetMaterialApp(
          title: 'App',
          debugShowCheckedModeBanner: false,
          home : HomeView()
      );
    }



  }
}
