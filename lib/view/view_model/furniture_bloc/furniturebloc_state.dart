part of 'furniturebloc_bloc.dart';

abstract class FurnitureblocState {}

final class FurnitureblocInitial extends FurnitureblocState {}

class CategoriesLoading extends FurnitureblocState {}

class CategoriesLoaded extends FurnitureblocState {
  final List<Category> categories;
  CategoriesLoaded(this.categories);
}

class CategoriesError extends FurnitureblocState {
  final String message;
  CategoriesError(this.message);
}
