import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/models/article_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final dio = Dio();

  Future<void> getArticles() async {
    try {
      emit(HomeLoading());
      final response = await dio.get(
        "https://newsapi.org/v2/top-headlines",
        queryParameters: {
          "apiKey": "f3e129b0c75e45cb826979df68e5dfc9",
          "country": "us",
        },
      );
      final articles = response.data["articles"] as List;
      final data = articles.map((e) => ArticleModel.fromJson(e)).toList();
      emit(HomeSuccess(data));
    } on DioException catch (e) {
      emit(HomeFailure(e.message ?? "There is dio exception"));
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }

  Future<void> searchArticles({required String query}) async {
    try {
      emit(HomeLoading());
      final response = await dio.get(
        "https://newsapi.org/v2/top-headlines",
        queryParameters: {
          "apiKey": "f3e129b0c75e45cb826979df68e5dfc9",
          "q": query,
        },
      );
      final articles = response.data["articles"] as List;
      final data = articles.map((e) => ArticleModel.fromJson(e)).toList();
      emit(HomeSuccess(data));
    } on DioException catch (e) {
      emit(HomeFailure(e.toString()));
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }
}
