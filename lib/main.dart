import 'package:cleanarchitecture/features/daily_news/presentation/bloc/article/remote/remot_article_bloc.dart';
import 'package:cleanarchitecture/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:cleanarchitecture/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:cleanarchitecture/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/theme/app_themes.dart';

Future<void> main() async {
  //this is called befor the run app to get all instances set
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(
      create: (context) => sl()..add(const GetArticles()) ,
      child: MaterialApp(
        theme: theme(),
        home: const DailyNews(),
      ),
    );
  }
}
