import 'package:flutter/material.dart';
import 'package:amap_location/amap_location.dart';
import 'package:dio/dio.dart';
import 'package:pollute/home_screen.dart';
import 'data/contaminated.dart';
import 'package:simple_permissions/simple_permissions.dart';
import 'package:easy_alert/easy_alert.dart';

void main() {
  AMapLocationClient.setApiKey("135fbf948462805a522c058a4fd9478e");
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}
