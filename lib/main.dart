import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/main_page.dart';
import 'view_models/user_view_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<UserViewModel>(
      // Create an instance of UserViewModel
      create: (context) => UserViewModel(),
      // Be sure to dispose UserViewModel when it's no longer needed
      dispose: (context, viewModel) => viewModel.dispose(),
      child: MaterialApp(
        title: 'Flutter MVVM Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MainPage(),
      ),
    );
  }
}
