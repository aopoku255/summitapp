import 'package:cbfapp/widgets/MainText.dart';
import 'package:flutter/material.dart';

class ProgramDetails extends StatefulWidget {
  const ProgramDetails({super.key});

  @override
  State<ProgramDetails> createState() => _ProgramDetailsState();
}

class _ProgramDetailsState extends State<ProgramDetails> {
  @override
  Widget build(BuildContext context) {
    final Map<String, String> session =
    ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    return Scaffold(
      appBar: AppBar(
        title: MainText(text: session['format'] ?? ""),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           MainText(text: session["title"] ?? "", fontSize: 24, fontWeight: FontWeight.bold,),
           MainText(text: session["description"] ?? ""),

          ],
        ),
      ),
    );
  }
}
