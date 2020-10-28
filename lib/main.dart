import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app.dart';
import 'cubit/cubit.dart';
import 'shared/bloc_observer.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(MultiBloc());
}

class MultiBloc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserCubit()),
        BlocProvider(create: (context) => PlantCubit()),
        BlocProvider(create: (context) => TransactionCubit()),
      ],
      child: MyApp(),
    );
  }
}
