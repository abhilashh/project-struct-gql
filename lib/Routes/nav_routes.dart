import 'package:flutter/material.dart';
import 'package:projectstructure/Routes/route_constants.dart';

class NavRoute{
  static void navToView(BuildContext context){
   Navigator.pushNamed(context, view);
  }
}