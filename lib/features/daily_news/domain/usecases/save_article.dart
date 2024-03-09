

import 'package:cleanarchitecture/features/daily_news/domain/entitites/arcticle.dart';
import 'package:cleanarchitecture/features/daily_news/domain/repositories/article_repository.dart';

import '../../../../core/usecases/usecase.dart';

class SaveArticleUseCase
    implements UseCase<void, ArticleEntity> {
       
  final ArticleRepository _articleRepository;

  SaveArticleUseCase(this._articleRepository);
  @override
  Future<void> call({ArticleEntity ?  params}) {
    return _articleRepository.saveArticle(params!);
  }
}
