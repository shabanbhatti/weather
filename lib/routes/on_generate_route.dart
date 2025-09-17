import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_project/Pages/Search%20page/search_page.dart';
import 'package:weather_project/Pages/Home%20page/home_page.dart';
import 'package:weather_project/Pages/Intro%20page/intro_page.dart';

Route<dynamic> onGenerateRoute(RouteSettings rs){

switch (rs.name) {
  case IntroPage.pageName:
    return CupertinoPageRoute(builder: (context) => IntroPage(), settings: rs);
    case Home.pageName:
    return MaterialPageRoute(builder: (context) => Home(),settings: rs);
      case SearchPage.pageName:
    return CupertinoPageRoute(builder: (context) => SearchPage(),settings: rs);
  default:
  return CupertinoPageRoute(builder: (context) => IntroPage(),);
}



}