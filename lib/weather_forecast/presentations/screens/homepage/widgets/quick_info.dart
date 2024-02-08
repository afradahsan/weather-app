import 'package:flutter/material.dart';

class QuickInfoWidget extends StatelessWidget {
  const QuickInfoWidget(
      {super.key,
      required this.image,
      required this.text,
      required this.value});

  final String image;
  final String text;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 90,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 40,
          ),
          Text(
            text,
            style: TextStyle(
                color: Colors.black, fontSize: 12, fontWeight: FontWeight.w500),
          ),
          Text(
            '$value',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
