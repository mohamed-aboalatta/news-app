import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/features/details/details_screen.dart';
import 'package:news_app/features/home/home_cubit.dart';
import 'package:news_app/features/home/home_item.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key, required this.query});

  final String query;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..searchArticles(query: query),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("$query results", style: TextStyle(fontSize: 30)),
          centerTitle: true,
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return Center(child: Lottie.asset("assets/Searching.json"));
            }
            if (state is HomeFailure) {
              return Text(state.msg);
            }
            if (state is HomeSuccess) {
              return ListView.builder(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
                itemCount: state.articles.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailsScreen(model: state.articles[index]),
                    ),
                  ),
                  child: HomeItem(
                    urlToImage: state.articles[index].urlToImage,
                    author: state.articles[index].author,
                    title: state.articles[index].title,
                    publishedAt: state.articles[index].publishedAt,
                  ),
                ),
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
