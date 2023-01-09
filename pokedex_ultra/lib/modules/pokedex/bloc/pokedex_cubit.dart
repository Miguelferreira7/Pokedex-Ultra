
import 'package:flutter_bloc/flutter_bloc.dart';
import 'pokedex_cubit_actions.dart';
import 'pokedex_cubit_model.dart';

class PokedexCubit extends Cubit<PokedexCubitModel> implements PokedexCubitActions {
  PokedexCubit() : super(PokedexCubitModel(
    darkTheme: true,
  ));
}
