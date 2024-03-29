

import 'package:cleanarchitecture/features/daily_news/domain/entitites/arcticle.dart';
import 'package:cleanarchitecture/features/daily_news/domain/repositories/article_repository.dart';

import '../../../../core/usecases/usecase.dart';

class GetSavedArticleUseCase
    implements UseCase<List<ArticleEntity>, void> {
       
  final ArticleRepository _articleRepository;

  GetSavedArticleUseCase(this._articleRepository);
  @override
  Future<List<ArticleEntity>> call({void params}) {
    return _articleRepository.getSavedArticles();
  }
}
