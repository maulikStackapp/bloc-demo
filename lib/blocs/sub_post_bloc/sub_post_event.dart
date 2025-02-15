abstract class SubPostEvent {}

class GetDataEvent extends SubPostEvent {
  final int id;

  GetDataEvent({required this.id});
}
