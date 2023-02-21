import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveConfig {
  static start() async {
    Directory dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    await Hive.openBox(AppConstants.ratingHiveBoxName);
  }
}

class AppConstants{
  static const apiUrl = 'https://pokeapi.co/api/v2';
  static const ratingHiveBoxName = 'pokemonRatingBox2';
}