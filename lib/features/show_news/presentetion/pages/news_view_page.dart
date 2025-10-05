import 'package:flutter/material.dart';
import 'package:news_app/core/constants/palette.dart';
import 'package:news_app/features/show_news/domain/entities/news_info.dart';

class NewsViewPage extends StatelessWidget {
  final NewsInfo newsInfo;
  const NewsViewPage({Key? key, required this.newsInfo}) : super(key: key);

  String _getdateinDDMMYYFormat() {
    final DateTime dateTime = newsInfo.dateTime;
    final String day = dateTime.day.toString().padLeft(2, '0');
    final String month = dateTime.month.toString().padLeft(2, '0');
    final String year = dateTime.year.toString().substring(2);
    return "$day/$month/$year";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.background,
      appBar: AppBar(
        backgroundColor: Palette.background,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Palette.deepBlue, size: 20),
        ),
        title: Text(
          newsInfo.title ?? "News Detail",
          style: const TextStyle(
            color: Palette.deepBlue,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                newsInfo.title ?? "No Title",
                style: const TextStyle(
                  color: Palette.deepBlue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 300,
                width: double.infinity,
                child: newsInfo.imageUrl != null
                    ? Image.network(
                        newsInfo.imageUrl!,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        height: 300,
                        color: Colors.grey[300],
                        alignment: Alignment.center,
                        child: const Text("No Image Available"),
                      ),
              ),
              const SizedBox(height: 16),
              Text(
                _getdateinDDMMYYFormat(),
                style: const TextStyle(color: Palette.lightGrey, fontSize: 14),
              ),
              const SizedBox(height: 16),
              Text(
                newsInfo.author ?? "No Author",
                style: const TextStyle(color: Palette.lightGrey, fontSize: 14),
              ),
              const SizedBox(height: 16),
              Text(
                newsInfo.content ?? "No Content",
                style: const TextStyle(color: Palette.deepBlue, fontSize: 14),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
