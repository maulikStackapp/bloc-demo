import 'package:bloc_demo/repository/sub_post_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'sub_post_event.dart';
import 'sub_post_state.dart';

class SubPostBloc extends Bloc<SubPostEvent, SubPostState> {
  final SubPostRepository subPostRepository;

  SubPostBloc({required this.subPostRepository}) : super(DataInitial()) {
    on<GetDataEvent>((event, emit) => subPostEvent(event, emit));
  }

  subPostEvent(GetDataEvent event, Emitter<SubPostState> emit) async {
    final id = event.id;
    try {
      emit(SubPostDataLoading());
      await subPostRepository.subPostUsers(id: id).then((users) => emit(SubPostDataLoaded(users)));
    } catch (e) {
      emit(SubPostDataError(e.toString()));
    }
  }
}
