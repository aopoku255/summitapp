import 'package:cbfapp/screens/displays/AgendaGrid.dart';
import 'package:cbfapp/screens/displays/AgendaList.dart';
import 'package:cbfapp/theme/colors.dart';
import 'package:flutter/material.dart';

import '../../widgets/MainText.dart';

class DashboardAgenda extends StatefulWidget {
  const DashboardAgenda({super.key});

  @override
  State<DashboardAgenda> createState() => _DashboardAgendaState();
}

class _DashboardAgendaState extends State<DashboardAgenda> {
  int selectedIndex = 0;

  final List<IconData> tabs = [Icons.grid_view, Icons.list_rounded];
  final tabPages = [AgendaGrid(), AgendaList()];
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
              backgroundColor: AppColors.primaryColor.withOpacity(0.4),
            ),
          ),
        ),
        title: MainText(
          text: "Agenda",
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/background.png"), alignment: Alignment.bottomLeft)),

          margin: EdgeInsets.only(top: 20),
          // decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/background.png"), alignment: Alignment.bottomCenter)),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              // const SizedBox(height: 20),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  Row(
                    children: List.generate(tabs.length, (index) {
                      final bool isSelected = selectedIndex == index;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Row(
                          children: [
                            // isSelected ? Icon(Icons.check, color: AppColors.primaryColor,) : MainText(text: ""),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                                decoration: BoxDecoration(
                                    color: isSelected
                                        ? AppColors.primaryColor.withOpacity(0.2)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(5)),
                                padding: EdgeInsets.all(8),
                                child: Icon(tabs[index]))
                          ],
                        ),
                      );
                    }),
                  ),
                ],
              ),
              const SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
  }
}
