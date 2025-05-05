import 'package:cbfapp/theme/colors.dart';
import 'package:cbfapp/widgets/Button.dart';
import 'package:cbfapp/widgets/MainText.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: AppBar(

      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/background.png"), alignment: Alignment.bottomLeft)),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage("assets/images/rogers.png"),
                ),
              ),

              Center(child: MainText(text: "Andrews Opoku", fontSize: 18,)),
              Center(child: MainText(text: "aopoku255@gmail.com", fontSize: 12,)),
              SizedBox(height: 10,),
              MainText(text: "Speaker", fontSize: 18, fontWeight: FontWeight.bold,),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MainText(text: "Country"),
                        MainText(text: "Ghana")
                      ],
                    ),
                    SizedBox(height:20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MainText(text: "Partners & Sponsors"),
                        Icon(Icons.chevron_right_rounded)
                      ],
                    ),
                    SizedBox(height:20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MainText(text: "Info"),
                        Icon(Icons.chevron_right_rounded)
                      ],
                    ),
                    SizedBox(height:20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MainText(text: "Why this matters"),
                        Icon(Icons.chevron_right_rounded)
                      ],
                    ),SizedBox(height:20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MainText(text: "Help & FAQs"),
                        Icon(Icons.chevron_right_rounded)
                      ],
                    ),SizedBox(height:20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MainText(text: "Report"),
                        Icon(Icons.chevron_right_rounded)
                      ],
                    ),
        
                  ],
                ),
              ),
              Button(label: "Join the CARISCA community"),
              SizedBox(height: 10,),
              Image.asset("assets/images/dilogo.png")
            ],
          ),
        ),
      ),
    );
  }
}
