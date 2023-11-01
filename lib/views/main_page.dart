import 'package:flutter/material.dart';
import 'user_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Use Navigator to push UserPage onto the stack
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => UserPage()));
          },
          child: const Text('Go to User Page'),
        ),
      ),
    );
  }
}
