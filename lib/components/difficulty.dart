import 'package:flutter/material.dart';

class Difficulty extends StatelessWidget {

  final int difficultyLevel;

  const Difficulty({
    required this.difficultyLevel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          Icons.star,
          size: 15,
          color: (index < difficultyLevel) ? Colors.blue : Colors.blue[100],
        );
      }),
    );
  }
}
