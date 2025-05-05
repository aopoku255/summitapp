import 'package:cbfapp/theme/colors.dart';
import 'package:cbfapp/widgets/Button.dart';
import 'package:cbfapp/widgets/MainText.dart';
import 'package:flutter/material.dart';

class SpeakerDetails extends StatefulWidget {
  const SpeakerDetails({super.key});

  @override
  State<SpeakerDetails> createState() => _SpeakerDetailsState();
}

class _SpeakerDetailsState extends State<SpeakerDetails> {
  @override
  Widget build(BuildContext context) {
    final Map<String, String> speaker =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: AppBar(
        title: MainText(text: speaker["name"] ?? "Speaker"),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width - 10,
        height: 500,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryGray.withOpacity(0.35)),
            borderRadius: BorderRadius.circular(10),
            color: Colors.white),
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                child: MainText(
                  text: speaker["name"].toString()[0] ?? "",
                ),
              ),
              title: MainText(
                text: speaker["name"] ?? "",
              ),
              subtitle: MainText(
                text: speaker["work"] ?? "",
              ),
            ),
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(speaker["image"] ?? ""),
                      fit: BoxFit.cover)),
            ),
            ListTile(
              title: MainText(text: speaker["title"] ?? "Suply Chain Summit"),
              subtitle: MainText(text: speaker["topic"] ?? "Suply Chain Summit"),
            ),
            Button(label: "Connect")
          ],
        ),
      ),
    );
  }
}
