import 'package:flutter/material.dart';
import 'package:projectstructure/Routes/nav_generation.dart';
import 'package:projectstructure/common/const.dart';
import 'package:projectstructure/providers/country_provider.dart';
import 'package:projectstructure/screens/home/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Countries());
}

class Countries extends StatelessWidget {
  const Countries({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CountryProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Const.projectTitle,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        routes: NavRouteGeneration.generateRoute(),
        home: const Home(),
      ),
    );
  }
}
