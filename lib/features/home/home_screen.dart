import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/features/details/details_screen.dart';
import 'package:news_app/features/home/home_cubit.dart';
import 'package:news_app/features/home/home_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> searchers = ["All", "Politic", "Sport", "Education"];

  late String val="All";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getArticles(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(15, 50, 15, 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    width: 40,
                    height: 40,
                    child: Icon(Icons.menu, color: Colors.black),
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        width: 40,
                        height: 40,
                        child: Icon(Icons.search, color: Colors.black),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        width: 40,
                        height: 40,
                        child: Icon(
                          Icons.notifications_none,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: .horizontal,
                  itemBuilder: (context, index) =>GestureDetector(
                    onTap: () {
                      setState(() {
                        val = searchers[index];
                      });
                      if(val == "All" ){
                        context.read<HomeCubit>().getArticles();
                      }else{
                        context.read<HomeCubit>().searchArticles(query: val);
                      }

                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: searchers[index] == val ? Color(0xffFFA500):Colors.white,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        searchers[index],
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: .w400,
                        ),
                      ),
                    ),
                  ),

                  separatorBuilder: (context, index) => SizedBox(width: 10),
                  itemCount: searchers.length,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    "News For You",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: .w600,
                    ),
                  ),
                  Text(
                    "Show More",
                    style: TextStyle(
                      color: Color(0xff2C57F0),
                      fontSize: 12,
                      fontWeight: .w600,
                    ),
                  ),
                ],
              ),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return Center(child: Lottie.asset("assets/Searching.json"));
                  }
                  if (state is HomeFailure) {
                    return Text(state.msg);
                  }
                  if (state is HomeSuccess) {
                    return Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.only(top: 0),
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
                      ),
                    );
                  }
                  return SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
