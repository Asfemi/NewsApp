import 'package:cleanarchitecture/features/daily_news/data/data_source/local/app_database.dart';
import 'package:cleanarchitecture/features/daily_news/data/data_source/remote/news_api_service.dart';
import 'package:cleanarchitecture/features/daily_news/data/repository/article_repository.dart';
import 'package:cleanarchitecture/features/daily_news/domain/repositories/article_repository.dart';
import 'package:cleanarchitecture/features/daily_news/domain/usecases/get_article.dart';
import 'package:cleanarchitecture/features/daily_news/domain/usecases/get_saved_article.dart';
import 'package:cleanarchitecture/features/daily_news/domain/usecases/remove_article.dart';
import 'package:cleanarchitecture/features/daily_news/domain/usecases/save_article.dart';
import 'package:cleanarchitecture/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:cleanarchitecture/features/daily_news/presentation/bloc/article/remote/remot_article_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final sl = GetIt.instance;

//this function would be called befor run app
Future<void> initializeDependencies() async {
  //
  final database =
      await $FloorAppDataBase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDataBase>(database);

  //Dio
  sl.registerSingleton<Dio>(Dio());

  //dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl(), sl()));

  //usecases
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));

  sl.registerSingleton<GetSavedArticleUseCase>(GetSavedArticleUseCase(sl()));
  sl.registerSingleton<SaveArticleUseCase>(SaveArticleUseCase(sl()));
  sl.registerSingleton<RemoveArticleUseCase>(RemoveArticleUseCase(sl()));

  //blocs
  //shouldnt be registered as singleton
  //because the bloc would return a new instance
  //when the state is changed
  sl.registerFactory<RemoteArticlesBloc>(() => RemoteArticlesBloc(sl()));
  //sl() is 3 cause local articl bloc has 3 use cases
  sl.registerFactory<LocalArticlesBloc>(() => LocalArticlesBloc(sl(), sl(), sl()));
}
