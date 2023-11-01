import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/user_view_model.dart';
import '../models/user.dart'; // Reference to your User model.

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Page'),
      ),
      body: StreamBuilder<User>(
        stream: Provider.of<UserViewModel>(context, listen: false).userStream,
        builder: (context, snapshot) {
          // Checking connection state first
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No user data available.'));
          } else {
            // Once the data is available, it can be displayed.
            User user = snapshot.data!;
            return Center(child: Text('User Data: ${user.toString()}'));
          }
        },
      ),
    );
  }
}
