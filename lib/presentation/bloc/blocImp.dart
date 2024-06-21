import 'package:bloc/bloc.dart';

import '../../data/model/itemModel.dart';
import '../../data/rebo/rebo.dart';
import 'blocState.dart';

class HomeCubit extends Cubit<HomeState> {
   DataRepository? repository;

  HomeCubit(this.repository) : super(HomeInitial());

  Future<void> fetchData() async {
    try {
      emit(HomeLoading());
      DataModel data = await repository!.fetchData();

      // Print the fetched data (optional)
      print(data.bestSelling.length);

      emit(HomeLoaded(data));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
