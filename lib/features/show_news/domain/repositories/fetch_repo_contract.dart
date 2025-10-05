import 'package:dartz/dartz.dart';
import 'package:news_app/features/show_news/domain/entities/news_info.dart';
import 'package:news_app/core/failures_successes/failures.dart';
abstract class FetchRepo{
  Future <Either<Failure,List<NewsInfo>>> fetchNews(String? searchText);
}