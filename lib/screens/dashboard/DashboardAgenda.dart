import 'package:cbfapp/screens/dashboard/Agenda/Day2.dart';
import 'package:cbfapp/screens/dashboard/Agenda/Day3.dart';
import 'package:cbfapp/screens/displays/AgendaGrid.dart';
import 'package:cbfapp/screens/displays/AgendaList.dart';
import 'package:cbfapp/theme/colors.dart';
import 'package:flutter/material.dart';

import '../../widgets/MainText.dart';
import 'Agenda/Day1.dart';

class DashboardAgenda extends StatefulWidget {
  const DashboardAgenda({super.key});

  @override
  State<DashboardAgenda> createState() => _DashboardAgendaState();
}

class _DashboardAgendaState extends State<DashboardAgenda> {

  final _tabs = [Day1(), Day1(), Day1()];


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
          bottom: TabBar(tabs: [
            Tab(text: "DAY 1",),
            Tab(text: "DAY 2",),
            Tab(text: "DAY 3",)
          ],),
        ),
        body: TabBarView(children: [
          Day1(),
          Day2(),
          Day3(),
        ],)
      ),
    );
  }
}
