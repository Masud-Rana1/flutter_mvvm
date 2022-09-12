import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view/home_screen.dart';
import 'package:mvvm/view/login_view.dart';
import 'package:mvvm/view/signup_view.dart';
import 'package:mvvm/view/splash_view.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      //final argument = settings.arguments;
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => const HomeScreen());
      case RoutesName.splash:
        return MaterialPageRoute(builder: (BuildContext context) => const SplashView());
      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context) => const LoginView());
      case RoutesName.signup:
        return MaterialPageRoute(builder: (BuildContext context) => const SignupView());
      default:
        return MaterialPageRoute(builder: (_){
          return Scaffold(
            body: Center(
              child: Text('No Route Defined'),
            ),
          );
        });
    }
  }
  }


//how to pass arguments while navigating?
// Ahmad Raza
// 2 months ago
// what if our class expect arguments, how to pass arguments while navigating?
//
//
// The Tech Brothers
// 2 months ago
// You have to create separate class for passing argument which i forget to share my knowledge in this video
// will make new video separate to explain this.
//
//
// Ahmad Raza
// 2 months ago
// @The Tech Brothers I manage to do it as
// case DownloadScreen.routeName:
// return MaterialPageRoute(builder: (context) => DownloadScreen(map: settings.arguments as Map));
// and while navigating
// Navigator.pushNamed(context, DownloadScreen.routeName, arguments: {'files': selectedFiles, "drawer": false})
