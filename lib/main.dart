import 'package:flutter/material.dart';
import 'package:pokeboti/app_widget.dart';
import 'package:pokeboti/locator.dart';
import 'package:pokeboti/settings/hive_config.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await HiveConfig.start();
  registerDependencies();
  runApp(const PokemonApp());
}
