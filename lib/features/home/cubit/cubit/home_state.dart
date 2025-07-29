part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final ArticlesModel topHeadLines;

  HomeSuccess(this.topHeadLines);
}

final class HomeErorr extends HomeState {
  final String error;

  HomeErorr(this.error);

}
