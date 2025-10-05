import 'package:get_it/get_it.dart';
import 'package:news_app/core/services/api.service.dart';
import 'package:news_app/features/show_news/data/data_sources/fetch_from_remote_ds.dart';
import 'package:news_app/features/show_news/domain/repositories/fetch_repo_contract.dart';
import 'package:news_app/features/show_news/domain/repositories/fetch_repo_impl.dart';
import 'package:news_app/features/show_news/domain/usecases/fetch_news.dart';
import 'package:news_app/features/show_news/presentetion/news%20cubit/news_cubit.dart';

GetIt s1 = GetIt.instance;

void setupServices() {
  // Servisler
  s1.registerSingleton<ApiService>(ApiServiceImpl());
  s1.registerSingleton<FetchFromRemoteDS>(FetchFromRemoteDsImpl());
  s1.registerSingleton<FetchRepo>(FetchRepoImpl());
  s1.registerSingleton<FetchNewsUsecase>(FetchNewsUsecase());

  // Cubit
  s1.registerFactory<NewsCubit>(() => NewsCubit(s1<FetchNewsUsecase>()));
}
