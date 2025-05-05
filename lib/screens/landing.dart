import 'package:cbfapp/theme/colors.dart';
import 'package:cbfapp/widgets/Button.dart';
import 'package:cbfapp/widgets/MainText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              Container(
                width: MediaQuery.of(context).size.width - 20,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/images/landing.png"))
                ),
              ),
        
              SizedBox(height: 40,),
              MainText(text: "Welcome to the", fontWeight: FontWeight.bold, fontSize: 24, ),
              Container(width: 300, margin: EdgeInsets.only(bottom: 20), child: MainText(text: "Research in Supply Chains and Innovation Summit", fontWeight: FontWeight.bold, fontSize: 24, color: AppColors.primaryBlue, textAlign: TextAlign.center,)),
              Container(width: 300, child: MainText(text: "The fifth annual Supply Chain Research Summit will be held July 16-18, 2025, in Lagos, Nigeria.", textAlign: TextAlign.center, color: AppColors.primaryBlue,)),
              Button(label: "Continue to login", onTap: (){
                Navigator.pushNamed(context, "/login");
              },)
            ],
          ),
        ),
      ),
    );
  }
}
