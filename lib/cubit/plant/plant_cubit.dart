import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/models.dart';
import '../../services/services.dart';

part 'plant_state.dart';

class PlantCubit extends Cubit<PlantState> {
  PlantCubit() : super(PlantInitial());

  Future<void> getFoods() async {
    ApiReturnValue<List<Plant>> result = await PlantServices.getPlants();

    if (result.value != null) {
      emit(PlantLoaded(plants: result.value));
    } else {
      emit(PlantLoadingFailed(result.message));
    }
  }
}
