import 'package:flutter/material.dart';

class Instagram extends StatelessWidget {
  const Instagram({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Download From Instagram')),
      body: const Center(child: Text('Instagram')),
    );
  }
}
