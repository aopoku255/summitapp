import 'package:cbfapp/screens/dashboard/KeynoteSpeakers.dart';
import 'package:cbfapp/screens/dashboard/PanelJudges.dart';
import 'package:cbfapp/screens/dashboard/SessionPanelist.dart';
import 'package:cbfapp/theme/colors.dart';
import 'package:cbfapp/widgets/MainText.dart';
import 'package:flutter/material.dart';

class DashboardSpeakers extends StatefulWidget {
  const DashboardSpeakers({super.key});

  @override
  State<DashboardSpeakers> createState() => _DashboardSpeakersState();
}

class _DashboardSpeakersState extends State<DashboardSpeakers> {
  int selectedIndex = 0;

  final List<String> tabs = ["Speakers", "Panelist","Chairs"];
  final List<String> tabNames = ["Speakers", "Session Panelists","Session Chairs"];
  final  tabPages = [KeynoteSpeakers(), SessionPanelist(), PanelJudges()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
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
      centerTitle: true, title: MainText(text: tabNames[selectedIndex],),),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                width: 350,
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
                            borderRadius: selectedIndex == 0 ? BorderRadius.only(bottomLeft: Radius.circular(50), topLeft: Radius.circular(50)): selectedIndex == 2 ? BorderRadius.only(bottomRight: Radius.circular(50), topRight: Radius.circular(50)) : BorderRadius.circular(0),
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
                                    color: isSelected ? AppColors.primaryColor : Colors.black.withOpacity(0.8),
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
    );
  }
}
