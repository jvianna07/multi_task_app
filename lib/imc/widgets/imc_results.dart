import 'package:flutter/material.dart';
import 'package:multi_task_app/utils/constants.dart';

class ImcResults extends StatelessWidget {
  final double imcResult;
  const ImcResults({required this.imcResult, super.key});

  Color get resultBoxColor => switch (imcResult) {
    < 18.5 => StaticImcColors().imcColorYellow,
    > 25.0 => StaticImcColors().imcColorRed,
    _ => StaticImcColors().imcColorGreen,
  };

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      height: 60,
      width: screenSize.width*.92,
      decoration: BoxDecoration(color: resultBoxColor,
      borderRadius: BorderRadius.circular(8)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Your body mass index:'),
          Text(
            imcResult.toStringAsFixed(2),
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
