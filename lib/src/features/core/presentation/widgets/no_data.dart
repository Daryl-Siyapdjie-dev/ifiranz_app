import 'package:flutter/material.dart';

class NoData extends StatelessWidget {
  final String text;
  const NoData({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}
