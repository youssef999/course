



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'auth_states.dart';

class AuthCubit extends Cubit <AuthStates> {
  AuthCubit() : super(AppIntialState());


  // AuthCubit(super.initialState);

  static AuthCubit get(context) => BlocProvider.of(context);

  String name='yyy';

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;


  Future<void> userLogin()   async {


    final box = GetStorage();

    emit(LoginLoadingState());

    try {

      await _auth.signInWithEmailAndPassword(
        email:emailController.text ,password:passController.text
      ).then((value){
        emit(LoginSuccessState());
        box.write('email', emailController.text);
      });
    } catch (e) {
      print("error" + e.toString());
      emit(LoginErrorState());
    }
  }



}