

 import 'package:course_app/presentation/resources/color_manager.dart';
import 'package:course_app/presentation/widgets/Custom_Text.dart';
import 'package:course_app/presentation/widgets/Custom_button.dart';
import 'package:flutter/material.dart';

 class Testing extends StatefulWidget {
  const Testing({Key? key}) : super(key: key);

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {

  String txt='hello';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          SizedBox(height: 50,),

          Custom_Text(text: txt,alignment: Alignment.center,fontSize: 24),

          SizedBox(height: 12,),

          Container(
            child:CustomButton(
              color1:ColorsManager.primary,
              color2:Colors.white,
              onPressed:(){

                setState(() {
                  txt='test';
                });

                },
              text: "change",
            ),
          ),
        ],
      ),
    );
  }
}
