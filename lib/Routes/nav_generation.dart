import 'package:flutter/cupertino.dart';
import 'package:projectstructure/Routes/route_constants.dart';
import 'package:projectstructure/screens/view/view.dart';

class NavRouteGeneration {
  static Map<String, WidgetBuilder> generateRoute({dynamic arguments}) {
    return {view: (context) => const View()};
  }
}

