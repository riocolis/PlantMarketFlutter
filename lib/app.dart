import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_market_flutter/models/models.dart';

import 'ui/pages/pages.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: PlantDetailPage(
        transaction: Transaction(plant: mockPlant[0]),
      ),
    );
  }
}
