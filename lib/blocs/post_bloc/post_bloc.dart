import 'package:bloc_demo/repository/data_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'post_event.dart';
import 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final UserRepository userRepository;

  PostBloc({required this.userRepository}) : super(PostInitial()) {
    on<GetPostEvent>((event, emit) => getPostEvent(event, emit));
  }

  getPostEvent(GetPostEvent event, Emitter<PostState> emit) async {
    emit(GetPostDataLoading());
    try {
      await userRepository.fetchUsers().then((users) => emit(GetPostDataLoaded(users)));
    } catch (e) {
      emit(GetPostDataError(e.toString()));
    }
  }
}
