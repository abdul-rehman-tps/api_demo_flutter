import 'package:api_demo/app.dart';
import 'package:api_demo/setup/di.dart';
import 'package:api_demo/setup/network.dart';
import 'package:flutter/material.dart';

void main() {
  setupDependencies();
  setupApiClient();
  runApp(const App());
}
