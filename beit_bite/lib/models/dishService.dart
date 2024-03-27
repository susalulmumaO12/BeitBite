import 'dart:convert';
import 'package:beit_bite/models/dishmodel.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final dishesProvider = FutureProvider<List<Dish>>((ref) async {
  String jsonString =
      await rootBundle.loadString('assets/mock-data/dishes.JSON');

  Map<String, dynamic> jsonData = json.decode(jsonString);

  List<dynamic> dishesData = jsonData['dishes'];

  List<Dish> dishes = dishesData.map((item) => Dish.fromJson(item)).toList();

  return dishes;
});
