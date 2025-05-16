import 'package:flutter/material.dart';

import '../../widgets/ExpandedText.dart';
import '../../widgets/MainText.dart';

class AgendaList extends StatefulWidget {
  const AgendaList({super.key});

  @override
  State<AgendaList> createState() => _AgendaListState();
}

class _AgendaListState extends State<AgendaList> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: MainText(text: "The important of supply chain",),
          subtitle: ExpandableText(text: "Suppply chain innovation and how it leads to success", maxLines: 1, color: Colors.black,),
          trailing: Column(
            children: [
              MainText(text: "July 16"),
              MainText(text: "8:00AM")
            ],
          ),
        ),
        Divider()
      ],
    );;

  }
}
