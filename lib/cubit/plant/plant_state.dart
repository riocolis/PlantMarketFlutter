part of 'plant_cubit.dart';

abstract class PlantState extends Equatable {
  const PlantState();

  @override
  List<Object> get props => [];
}

class PlantInitial extends PlantState {}

class PlantLoaded extends PlantState {
  final List<Plant> plants;

  PlantLoaded({this.plants});

  @override
  List<Object> get props => [plants];
}

class PlantLoadingFailed extends PlantState {
  final String message;

  PlantLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
