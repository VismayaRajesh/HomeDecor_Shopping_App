part of 'furniturebloc_bloc.dart';

abstract class FurnitureblocEvent {}

class LoadCategoriesEvent extends FurnitureblocEvent {
  final String? userName;
  LoadCategoriesEvent({this.userName});
}
