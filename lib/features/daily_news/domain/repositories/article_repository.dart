import 'package:cleanarchitecture/core/resources/data_state.dart';
import 'package:cleanarchitecture/features/daily_news/domain/entitites/arcticle.dart';

abstract class ArticleRepository {
  //api methods
  Future<DataState<List<ArticleEntity>>> getNewsArticles();

  // database methods
  Future<List<ArticleEntity>> getSavedArticles();

  Future<void> saveArticle(ArticleEntity article);

  Future<void> removeArticle(ArticleEntity article);
}
