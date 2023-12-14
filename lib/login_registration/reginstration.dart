import 'package:flutter/material.dart';

class Registration extends StatelessWidget {
  const Registration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register to be part of KidsApp Family 🙃'),
      ),
      body: const Center(
        child: Text('Welcome to Registration page!'),
      ),
    );
  }
}
