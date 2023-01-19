import 'package:pokedex_ultra/utils/generation_utils.dart';

import '../../../utils/pokedex_selection_enum.dart';

abstract class PokedexCubitActions{

  void setPokedexOrFavoritesSelected(PokedexSelectionEnum option);

  void getPokedexCompleted(Generation generation);

}