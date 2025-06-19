import 'package:flutter/material.dart';

class Facebook extends StatelessWidget {
  const Facebook({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Download From Facebook')),
      body: const Center(child: Text('Facebook')),
    );
  }
}
