import 'package:bloc_demo/model/data_model.dart';

abstract class PostState {}

class PostInitial extends PostState {}

class GetPostDataLoaded extends PostState {
  final List<DataModel> postList;

  GetPostDataLoaded(this.postList);
}

class GetPostDataLoading extends PostState {}

class GetPostDataError extends PostState {
  final String message;

  GetPostDataError(this.message);
}
