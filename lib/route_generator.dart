import 'package:flutter/material.dart';
import 'package:usermanagementapp/views/screens/create_user_form_page.dart';
import 'package:usermanagementapp/views/screens/home_page.dart';

class RouteGenerator {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/createUser':
        return MaterialPageRoute(builder: (_) => const CreateUserFormPagee());

      default:
        return _errorRoute();
    }
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(
    builder: (_) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('Error')),
      );
    },
  );
}
