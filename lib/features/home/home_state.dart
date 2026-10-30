part of 'home_cubit.dart';

abstract class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  List<ArticleModel> articles;
  HomeSuccess(this.articles);
}

final class HomeFailure extends HomeState {
  String msg;
  HomeFailure(this.msg);
}
