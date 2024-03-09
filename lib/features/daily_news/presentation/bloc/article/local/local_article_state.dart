import 'package:cleanarchitecture/features/daily_news/domain/entitites/arcticle.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';

abstract class LocalArticleState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioException? error;

  const LocalArticleState({this.articles, this.error});

  @override
  List<Object> get props => [articles!, error!];
}

//when the article is loading
class LocalArticlesLoading extends LocalArticleState {
  const LocalArticlesLoading();
}

//when the article is done load and has data
class LocalArticlesDone extends LocalArticleState {
  const LocalArticlesDone(List<ArticleEntity> article)
      : super(articles: article);
}


