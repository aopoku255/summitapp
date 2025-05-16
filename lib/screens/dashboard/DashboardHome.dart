import 'package:cbfapp/screens/HomeTabPages/HomeOngoing.dart';
import 'package:cbfapp/screens/HomeTabPages/HomeUpcoming.dart';
import 'package:cbfapp/theme/colors.dart';
import 'package:cbfapp/widgets/MainText.dart';
import 'package:flutter/material.dart';

class DashboardHome extends StatefulWidget {
  const DashboardHome({super.key});

  @override
  State<DashboardHome> createState() => _DashboardHomeState();
}

class _DashboardHomeState extends State<DashboardHome> {
  int selectedIndex = 0;

  final List<String> tabs = ["Ongoing", "Upcoming"];
  final  tabPages = [HomeOngoing(), HomeUpcoming()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        leading: InkWell(
          onTap: () {
            Navigator.pushNamed(context, "/profile");
          },
          child: Container(
            margin: const EdgeInsets.only(left: 10),
            child: CircleAvatar(

              child: MainText(
                text: "A",
                fontWeight: FontWeight.bold,
                fontSize: 24,

              ),
              backgroundColor: AppColors.primaryColor.withOpacity(0.25),
            ),
          ),
        ),
        centerTitle: true,
        title: const MainText(text: "Welcome, Andrews"),
        actions: [
          InkWell(
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              child: Image.asset("assets/images/megaphone.png", scale: 1.2),
            ),
          )
        ],
      ),
      backgroundColor: AppColors.primaryBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/background.png"), alignment: Alignment.bottomCenter)),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/homebanner.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primaryColor, width: 1),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    children: List.generate(tabs.length, (index) {
                      final bool isSelected = selectedIndex == index;
                      return Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: isSelected ? AppColors.primaryColor.withOpacity(0.2) : Colors.transparent,
                              borderRadius: selectedIndex == 0 ? BorderRadius.only(bottomLeft: Radius.circular(50), topLeft: Radius.circular(50)): BorderRadius.only(bottomRight: Radius.circular(50), topRight: Radius.circular(50)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    isSelected ? Icon(Icons.check, color: AppColors.primaryColor,) : MainText(text: ""),
                                     SizedBox(width: 10,),
                                    MainText(
                                      text: tabs[index],
                                      fontWeight: FontWeight.w600,
                                      color: isSelected ? AppColors.primaryColor : Colors.black,
                                    ),
                                  ],
                                ),
          
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(height: 20),
                tabPages[selectedIndex],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
