import 'dart:async';

import 'package:floor/floor.dart';

import 'package:cleanarchitecture/features/daily_news/data/data_source/local/DAO/article_dao.dart';
import 'package:cleanarchitecture/features/daily_news/data/models/arcticle.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'app_database.g.dart';

@Database(version: 1, entities: [ArticleModel])
abstract class AppDataBase extends FloorDatabase {
  ArticleDao get articleDao;
}

//to generate the floor database using generator
//run the comand: flutter pub run build_runner build
