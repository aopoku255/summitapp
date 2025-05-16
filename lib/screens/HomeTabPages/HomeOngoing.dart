import 'package:cbfapp/theme/colors.dart';
import 'package:cbfapp/widgets/ExpandedText.dart';
import 'package:cbfapp/widgets/MainText.dart';
import 'package:flutter/material.dart';

class HomeOngoing extends StatefulWidget {
  const HomeOngoing({super.key});

  @override
  State<HomeOngoing> createState() => _HomeOngoingState();
}

class _HomeOngoingState extends State<HomeOngoing> {
  @override
  Widget build(BuildContext context) {

    Widget _buildTag(String text) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(50),
        ),
        child: MainText(text: text, color: Colors.white),
      );
    }

    Widget _buildAction(String iconPath, String label) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            Image.asset(iconPath, height: 20),
            SizedBox(width: 5),
            MainText(text: label),
          ],
        ),
      );
    }


    const _ongoingSession = [
      {
        "title": "Logistics and transportation management",
        "description": "The logistics and mangement is a program",
        "month": "Jul 16",
        "time": "9:00 - 10:00",
        "format": "Breakout session",
        "speaker": "Dale Rogers",
        "room": "Talking room"
      },
      {
        "title": "Supply Chain Optimization",
        "description": "A deep dive into supply chain efficiency.",
        "month": "Jul 16",
        "time": "10:00 - 11:00",
        "format": "Main session",
        "speaker": "Jane Doe",
        "room": "Main Hall"
      }
    ];

    return SizedBox(
      height: 220, // Slightly more than card height to allow spacing
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(

          children: List.generate(_ongoingSession.length, (index) {
            final session = _ongoingSession[index];

            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/program-details", arguments: session);
              },
              child: Container(
                margin: EdgeInsets.only(right: 15),
                padding: EdgeInsets.all(10),
                width: 320,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/background.png"),
                    alignment: Alignment.center,
                    fit: BoxFit.cover,
                    opacity: 0.7,
                    repeat: ImageRepeat.repeatY,
                  ),
                  color: AppColors.primaryGold.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        _buildTag(session["month"] ?? ""),
                        SizedBox(width: 10),
                        _buildTag(session["time"] ?? ""),
                        SizedBox(width: 10),
                        _buildTag(session["format"] ?? ""),
                      ],
                    ),
                    SizedBox(height: 20),
                    MainText(
                      text: session["title"] ?? "",
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    SizedBox(height: 10),
                    ExpandableText(
                      text: session["description"] ?? "",
                      maxLines: 2,
                    ),
                    Spacer(),
                    Row(
                      children: [
                        _buildAction("assets/images/qrcode.png", "Check in"),
                        SizedBox(width: 5),
                        _buildAction("assets/images/vote.png", "Vote"),
                        SizedBox(width: 5),
                        _buildAction("assets/images/live.png", "Join live"),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

}
