

  import 'package:course_app/presentation/resources/color_manager.dart';
import 'package:course_app/presentation/widgets/Custom_Text.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        toolbarHeight: 1,
      ),
      body:Column(
        children: [
          SizedBox(height: 30,),
          Custom_Text(text: "Home",color:ColorsManager.primary,alignment:Alignment.center,fontSize: 23,)
        ],
      ),
    );
  }
}
