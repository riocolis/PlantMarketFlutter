import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_market_flutter/models/models.dart';

import 'ui/pages/pages.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      // home: PaymentPage(
      //   transaction: Transaction(
      //       plant: mockPlant[0],
      //       user: mockUser,
      //       quantity: 10,
      //       total: (mockPlant[0].price * 2 * 1.1).toInt() + 50000),
      // ),
    );
  }
}
