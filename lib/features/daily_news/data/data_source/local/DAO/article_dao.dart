import 'package:floor/floor.dart';

import '../../../models/arcticle.dart';

@dao
abstract class ArticleDao {
  @Insert()
  Future<void> insertArticle(ArticleModel article);

  @delete
  Future<void> deleteArticle(ArticleModel articleModel);

 
 //write the sql query inside the @Query block
  @Query('SELECT * FROM article')
  Future<List<ArticleModel>> getArticles();
}
