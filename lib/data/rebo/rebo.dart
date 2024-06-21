import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import '../model/itemModel.dart';


class DataRepository {
  Future<DataModel> fetchData() async {
    final response = await rootBundle.loadString('assets/dummyData.json');
    final data = jsonDecode(response);
    return DataModel.fromJson(data);
  }
}
