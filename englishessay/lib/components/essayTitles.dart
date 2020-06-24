import 'package:englishessay/Model/essay.dart';
import 'package:englishessay/components/essayTitle.dart';
import 'package:englishessay/screens/EssayView.dart';
import 'package:flutter/material.dart';

class EssayTitleCard extends StatelessWidget {
  const EssayTitleCard({
    Key key,
    @required this.essayList,
  }) : super(key: key);

  final List<Essay> essayList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: essayList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EssayView(
                              essaydata:
                                  essayList[index])));
                },
                child: EssayTitle(
                  title: essayList[index].title,
                ),
              );
            }));
  }
}
