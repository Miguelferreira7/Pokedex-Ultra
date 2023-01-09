
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_page_cubit_actions.dart';
import 'home_page_cubit_model.dart';

class HomePageCubit extends Cubit<HomePageCubitModel> implements HomePageCubitActions {
  HomePageCubit() : super(HomePageCubitModel(
    darkTheme: true,
  ));



}
