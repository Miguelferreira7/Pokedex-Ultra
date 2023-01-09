class HomePageCubitModel {
  bool? darkTheme;

  HomePageCubitModel({
    this.darkTheme
  });

  HomePageCubitModel patchState({
    bool? darkTheme
  }) {

    return HomePageCubitModel(
      darkTheme: darkTheme ?? this.darkTheme
    );
  }
}
