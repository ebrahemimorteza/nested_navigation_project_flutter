
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nashreasar/repository/bloc/event.dart';
import 'package:nashreasar/repository/bloc/state.dart';
import 'package:nashreasar/repository/repository_screen.dart';
/* class bloc to Category */
class Category_bloc
    extends Bloc<Category_bloc_event, Category_bloc_state> {
  late final Repository _repository;

  Category_bloc(this._repository)
      : super(Category_bloc_state_loading()) {
    print("........................................");
    on<Category_bloc_event_loading>((event, emit) async {
      emit(Category_bloc_state_loading());
      try {
        final category = await _repository.getCategory();
        emit(Category_bloc_state_loaded(category));
      } catch (e) {
        emit(Category_bloc_state_Error(e.toString()));
      }
    });
  }
}


