import 'dart:io';

import 'package:cleanarchitecture/features/daily_news/data/data_source/local/app_database.dart';
import 'package:cleanarchitecture/features/daily_news/domain/entitites/arcticle.dart';
import 'package:dio/dio.dart';
import 'package:cleanarchitecture/core/constants/constants.dart';
import 'package:cleanarchitecture/core/resources/data_state.dart';
import 'package:cleanarchitecture/features/daily_news/data/data_source/remote/news_api_service.dart';
import 'package:cleanarchitecture/features/daily_news/data/models/arcticle.dart';
import 'package:cleanarchitecture/features/daily_news/domain/repositories/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  final AppDataBase _appDataBase;

  ArticleRepositoryImpl(this._newsApiService, this._appDataBase);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: newsAPIkey,
        country: countryQuery,
        category: categoryQuery,
      );

      //we would check that if the data send was successful we would return the
      //list of data
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  //note we should not use entity in the data layer, rather use model
  @override
  Future<List<ArticleModel>> getSavedArticles() async {
    return _appDataBase.articleDao.getArticles();
  }

  @override
  Future<void> removeArticle(ArticleEntity article) {
    return _appDataBase.articleDao
        .deleteArticle(ArticleModel.fromEntity(article));
  }

  @override
  Future<void> saveArticle(ArticleEntity article) {
    return _appDataBase.articleDao
        .insertArticle(ArticleModel.fromEntity(article));
  }
}
