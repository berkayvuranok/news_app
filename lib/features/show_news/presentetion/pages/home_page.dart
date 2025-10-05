import 'package:flutter/material.dart';
import 'package:news_app/core/constants/palette.dart';
import 'package:news_app/features/show_news/presentetion/components/news_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/show_news/presentetion/news%20cubit/news_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Haberleri çek
    context.read<NewsCubit>().fetchNews(null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.background,
      appBar: AppBar(
        backgroundColor: Palette.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: const Text(
          "News",
          style: TextStyle(
            color: Palette.deepBlue,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            TextField(
              onSubmitted: (searchText) {
                context.read<NewsCubit>().fetchNews(searchText.isEmpty ? null : searchText);
              },
              cursorColor: Palette.deepBlue,
              style: const TextStyle(
                color: Palette.deepBlue,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Palette.lightGrey,
                  size: 20,
                ),
                hintText: "Search",
                hintStyle: TextStyle(
                  color: Palette.lightGrey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Palette.lightGrey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Palette.deepBlue),
                ),
              ),
            ),
            const SizedBox(height: 16),
            BlocBuilder<NewsCubit,NewsState>(builder: (context, state) {
              if(state is NewsInitialSearch){
                return Text(
              " ${state.news.length} results found",
              style: const TextStyle(
                color: Palette.deepBlue,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            );
              } else if(state is NewsInitial){
                 return Text(
              "Top News - ${state.news.length} results found",
              style: const TextStyle(
                color: Palette.deepBlue,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            );
              }
              return const SizedBox.shrink();
            },),
            const SizedBox(height: 16),
            Expanded(
              child: BlocBuilder<NewsCubit, NewsState>(
                builder: (context, state) {
                  if (state is NewsLoading) {
                    return const Center(
                      child: CircularProgressIndicator(color: Palette.deepBlue),
                    );
                  } else if (state is NewsInitial) {
                    if (state.news.isEmpty) {
                      return const Center(
                        child: Text(
                          "No news found",
                          style: TextStyle(
                            color: Palette.deepBlue,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }
                    return ListView.builder(
                      itemCount: state.news.length,
                      itemBuilder: (context, index) {
                        return NewsCard(newsInfo: state.news[index]);
                      },
                    );
                  } else if(state is NewsInitialSearch){
                     return ListView.builder(
                      itemCount: state.news.length,
                      itemBuilder: (context, index) {
                        return NewsCard(newsInfo: state.news[index]);
                      },
                    );

                  }
                  else if (state is NewsError) {
                    return const Center(
                      child: Text(
                        "Error loading news",
                        style: TextStyle(
                          color: Palette.deepBlue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
