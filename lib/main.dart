import 'dart:io';

import 'package:background_fetch/background_fetch.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart'; 
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart'; 

import 'package:taqueria_vargas/core/core.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
   
  GoRouter.optionURLReflectsImperativeAPIs = true;

  await CacheServiceImpl().initService();

  usePathUrlStrategy();

  runApp(ProviderScope(child: MainApp()));

  if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {

    BackgroundFetch.registerHeadlessTask(BackgroundFetchService.backgroundFetchHeadlessTask);
    
  }

  
}
class MainApp extends ConsumerWidget {

  const MainApp({super.key});

  @override
  Widget build(BuildContext context,ref) {

    final appRouter = ref.watch(appRouterProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Template',
      theme: AppTheme.appTheme,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: const [Locale('es')],
      routerConfig: appRouter
    );
    
  }

}
