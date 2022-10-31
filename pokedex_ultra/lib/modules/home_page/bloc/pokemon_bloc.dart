
import 'package:flutter_bloc/flutter_bloc.dart';
import 'pokemon_cubit_actions.dart';
import 'pokemon_cubit_model.dart';

class PokemonCubit extends Cubit<PokemonCubitModel> implements PokemonCubitActions {
  PokemonCubit() : super(PokemonCubitModel(
    darkTheme: true,
  ));



}
