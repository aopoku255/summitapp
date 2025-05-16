import 'package:cbfapp/theme/colors.dart';
import 'package:cbfapp/widgets/Button.dart';
import 'package:cbfapp/widgets/MainText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: AppBar(
        toolbarHeight: 50,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/gold.png"), fit: BoxFit.cover)
          ),
        ),
      ),
      bottomSheet: Container(
        height: 50,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/dilogo.png"))
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            margin: EdgeInsets.only(top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/africa.png"), alignment: Alignment.topRight)),
                ),
                SizedBox(height: 20,),
                MainText(text: "Welcome Back!", fontWeight: FontWeight.bold, fontSize: 28, color: AppColors.primaryGray,),
                SizedBox(height: 60,),
                Form(child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MainText(text: "Email address", textAlign: TextAlign.left, fontWeight: FontWeight.bold, color: AppColors.primaryGray,),
            
                        TextFormField(
                        decoration: InputDecoration(
                          // labelText: "Email address",
                          labelStyle: TextStyle(fontSize: 20, color: AppColors.primaryGray),
                          hintText: "example@email.com",
                          fillColor: AppColors.primaryBlue,
                        ),
                        ),
                        SizedBox(height: 40,),
                        MainText(text: "Password", textAlign: TextAlign.left, fontWeight: FontWeight.bold, color: AppColors.primaryGray,),
            
                        TextFormField(
                        decoration: InputDecoration(
                          // labelText: "Password",
                          labelStyle: TextStyle(fontSize: 20, color: AppColors.primaryGray),
                          hintText: "Enter your password",
                          suffixIcon: Icon(Icons.visibility),
            
                        ),
                          obscureText: true,
                        ),
                        Center(
                          child: Button(label: "Sign in", backgroundColor: AppColors.primaryColor, onTap: (){
                            Navigator.pushNamed(context, "/dashboard");
                          },),
                        )
                      ],
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
