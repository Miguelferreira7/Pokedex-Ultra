class PokedexCubitModel {
  bool? darkTheme;

  PokedexCubitModel({
    this.darkTheme
  });

  PokedexCubitModel patchState({
    bool? darkTheme
  }) {

    return PokedexCubitModel(
      darkTheme: darkTheme ?? this.darkTheme
    );
  }
}
