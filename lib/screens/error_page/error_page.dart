import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String error;
  const ErrorPage({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Text(error, style: TextStyle(fontSize: 20, color: Colors.red)),
      ),
    );
  }
}
