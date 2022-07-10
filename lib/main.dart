import 'package:flutter/material.dart';
import 'package:weatherapptask/service/dio_helper.dart';
import 'package:weatherapptask/src/app_root.dart';

void main() {
  DioHelper.init();
  runApp(const AppRoot());
}
