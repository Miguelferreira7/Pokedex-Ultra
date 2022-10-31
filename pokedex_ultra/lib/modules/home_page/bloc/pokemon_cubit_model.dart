class PokemonCubitModel {
  bool? darkTheme;

  PokemonCubitModel({
    this.darkTheme
  });

  PokemonCubitModel patchState({
    bool? darkTheme
  }) {

    return PokemonCubitModel(
      darkTheme: darkTheme ?? this.darkTheme
    );
  }
}
