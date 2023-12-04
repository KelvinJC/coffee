import 'package:coffee_app/pages/coffee_detail_screen.dart';
import 'package:coffee_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:coffee_app/models/models.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('This is route ${settings.name}');
    final arguments = settings.arguments as Coffee;

    switch (settings.name) {
      case '/':
        return HomePage.route();
      case HomePage.routeName:
        return HomePage.route();
      case '/coffee_detail':
            // the details page for one specific coffee
        return CoffeeDetailScreen.route(arguments);
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        settings: RouteSettings(name: '/error'),
        builder: (_) => Scaffold(appBar: AppBar(title: Text('Error'),) ,)
    );
  }
}