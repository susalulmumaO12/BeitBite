import 'dart:convert';
import 'package:beit_bite/models/catmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final catProvider = FutureProvider<List<categoryModel>>((ref) async {
  String jsonString =
      await rootBundle.loadString('assets/mock-data/categories.JSON');

  Map<String, dynamic> jsonData = json.decode(jsonString);

  List<dynamic> catData = jsonData['categories'];

  List<categoryModel> cats =
      catData.map((item) => categoryModel.fromJson(item)).toList();

  return cats;
});
