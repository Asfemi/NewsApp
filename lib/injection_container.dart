import 'package:cleanarchitecture/features/daily_news/data/data_source/remote/news_api_service.dart';
import 'package:cleanarchitecture/features/daily_news/data/repository/article_repository.dart';
import 'package:cleanarchitecture/features/daily_news/domain/repositories/article_repository.dart';
import 'package:cleanarchitecture/features/daily_news/domain/usecases/get_article.dart';
import 'package:cleanarchitecture/features/daily_news/presentation/bloc/article/remote/remot_article_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final sl = GetIt.instance;

//this function would be called befor run app
Future<void> initializeDependencies() async {
  //Dio
  sl.registerSingleton<Dio>(Dio());

  //dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));

  //usecases
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));

  //blocs
  //shouldnt be registered as singleton
  //because the bloc would return a new instance
  //when the state is changed
  sl.registerFactory<RemoteArticlesBloc>(
    () => RemoteArticlesBloc(sl())
  );
}
