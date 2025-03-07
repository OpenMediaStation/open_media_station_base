import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    super.key,
    required this.screenWidth,
    required this.title,
  });

  final double screenWidth;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: FittedBox(
        child: Row(
          children: [
            const Image(
              image: AssetImage('assets/myapp.png'),
              height: 60,
            ),
            Text(screenWidth > 300 ? title : ''),
          ],
        ),
      ),
    );
  }
}
