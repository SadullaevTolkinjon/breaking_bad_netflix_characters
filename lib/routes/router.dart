import 'package:breakingbad/model/breaking_model.dart';
import 'package:breakingbad/pages/home_page.dart';
import 'package:breakingbad/pages/info_page.dart';
import 'package:breakingbad/pages/search_page.dart';
import 'package:flutter/material.dart';

class RouterGenerator {
  static generateRoute(RouteSettings settings) {
    var args = settings.arguments;

    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => HomePage());
      case "/info":
        return MaterialPageRoute(
            builder: (context) => InfoPAge(
                  breaking: (args as BreakingBad),
                ));
      case "/search":
        return MaterialPageRoute(
            builder: (context) => SearchPAge(
                  data: (args as List<BreakingBad>),
                ));
    }
  }
}
