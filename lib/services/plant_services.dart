part of 'services.dart';

class PlantServices {
  static Future<ApiReturnValue<List<Plant>>> getPlants() async {
    await Future.delayed(Duration(milliseconds: 500));

    return ApiReturnValue(value: mockPlant);
  }
}
