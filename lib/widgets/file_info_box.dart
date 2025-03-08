import 'package:flutter/material.dart';

class FileInfoBox extends StatelessWidget {
  final String text;

  const FileInfoBox(this.text, {super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
        decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(99, 158, 158, 158)),
            borderRadius: BorderRadius.circular(8),
            color: Colors.transparent
            ),
        child: Text(
          text,
          style: TextStyle(
              color: Colors.grey.shade500, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}