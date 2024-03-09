import 'package:cleanarchitecture/features/daily_news/domain/entitites/arcticle.dart';
import 'package:equatable/equatable.dart';

abstract class LocalArticleEvent extends Equatable {
  final ArticleEntity? article;
  const LocalArticleEvent({this.article});

  @override
  List<Object> get props => [article!];
}

class GetSavedArticles extends LocalArticleEvent {
  const GetSavedArticles();
}

class RemoveArticle extends LocalArticleEvent {
  const RemoveArticle(ArticleEntity article) : super(article: article);
}

class SaveArticle extends LocalArticleEvent {
  const SaveArticle(ArticleEntity article) : super(article: article);
}