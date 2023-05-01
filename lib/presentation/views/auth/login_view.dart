import 'package:course_app/presentation/bloc/auth/auth_cubit.dart';
import 'package:course_app/presentation/bloc/auth/auth_states.dart';
import 'package:course_app/presentation/resources/color_manager.dart';
import 'package:course_app/presentation/views/Home/home_view.dart';
import 'package:course_app/presentation/widgets/Custom_Text.dart';
import 'package:course_app/presentation/widgets/Custom_button.dart';
import 'package:course_app/presentation/widgets/app_message.dart';
import 'package:course_app/presentation/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';



class UserLoginView extends StatelessWidget {

  const UserLoginView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return BlocProvider(
        create: (BuildContext context) => AuthCubit(),
        child:
        BlocConsumer <AuthCubit, AuthStates> (listener: (context, state) {


          if (state is LoginSuccessState) {

            appMessage(text: 'تم تسجيل الدخول بنجاح');

            Get.offAll(HomeView());

          }

          if (state is LoginErrorState) {
            appMessage(text: 'خطا في تسجيل دخول');
          }

          if (state is LoginLoadingState) {
            print("LOADING");
          }



          },

            builder: (context, state) {

          AuthCubit authCubit = AuthCubit.get(context);

          return Scaffold(
            backgroundColor: Colors.grey[100],
            appBar: AppBar(
              elevation: 0,
              backgroundColor: ColorsManager.primary,
              toolbarHeight: 1,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 700,
                          height: 180,
                          color:Colors.white,
                          child: Column(
                            children: [
                              Container(
                                width: 600,
                                height: 160,
                                child: Image.asset(
                                  'assets/images/img.png',
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                              SizedBox(height: 10,)
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Custom_Text(
                          text: ' قم تسجيل دخول ',
                          fontSize: 24,
                          alignment: Alignment.center,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        CustomTextFormField(
                          controller: authCubit.emailController,
                          color: Colors.black,
                          hint: "بريد الكتروني ",
                          obs: false,
                          obx: false,
                          ontap: () {},
                          type: TextInputType.text,
                        ),

                        const SizedBox(
                          height: 30,
                        ),

                        CustomTextFormField(
                          controller: authCubit.passController,
                          color: Colors.black,
                          hint: "كلمة المرور ",
                          obs: true,
                          obx: true,
                          ontap: () {},
                          type: TextInputType.text,
                        ),

                        const SizedBox(
                          height: 40,
                        ),
                        CustomButton(
                            text: "تسجيل الدخول ",
                            onPressed: () {

                              authCubit.userLogin();

                            },
                            color1: ColorsManager.primary,
                            color2: Colors.white),
                        const SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Custom_Text(
                                  text: 'ليس لديك حساب ؟ ',
                                  fontSize: 17,
                                  color: Colors.grey),
                              SizedBox(
                                width: 10,
                              ),
                              Custom_Text(
                                  text: 'انشاء حساب  ',
                                  fontSize: 15,
                                  color: ColorsManager.primary),
                            ],
                          ),
                          onTap: () {

                            //Get.to(RegisterView());
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );


        }));
  }
}

