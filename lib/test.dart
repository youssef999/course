


 import 'package:course_app/presentation/widgets/Custom_Text.dart';
import 'package:course_app/presentation/widgets/Custom_button.dart';
import 'package:flutter/material.dart';

import 'presentation/resources/color_manager.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Center(child:

          Text("hello",style:TextStyle(fontSize:28),),),

          Custom_Text(text: 'hello',fontSize:27,color:Colors.black,),

          Container(
            child:CustomButton(
              color1:ColorsManager.primary,
              color2:Colors.white,
              onPressed:(){

              },
              text: "change",
            ),
          ),
        ],
      ),
    );
  }
}
