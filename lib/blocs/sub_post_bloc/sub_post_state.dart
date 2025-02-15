import 'package:bloc_demo/model/data_model.dart';

abstract class SubPostState {}

class DataInitial extends SubPostState {
  DataInitial();
}

class SubPostDataLoaded extends SubPostState {
  final DataModel userList;

  SubPostDataLoaded(this.userList);
}

class SubPostDataLoading extends SubPostState {}

class SubPostDataError extends SubPostState {
  final String message;

  SubPostDataError(this.message);
}
