import 'package:ashyk_aydyn_com/src/bottom_nav/bottom_nav_screen.dart';
import 'package:ashyk_aydyn_com/src/core/language_delegates.dart';
import 'package:ashyk_aydyn_com/src/providers/file_provider.dart';
import 'package:ashyk_aydyn_com/src/providers/intial_provider.dart';
import 'package:ashyk_aydyn_com/src/providers/new_videos_provider.dart';
import 'package:ashyk_aydyn_com/src/providers/subcaigory_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('tk'),
        Locale('ru'),
      ],
      path: 'assets/languages',
      fallbackLocale: const Locale('tk'),
      startLocale: const Locale('tk'),
      child: MultiProvider(providers: [
        ChangeNotifierProvider<InitialProvider>(
          create: (_) => InitialProvider(),
        ),
        ChangeNotifierProvider<NewVideosProvider>(
          create: (_) => NewVideosProvider(),
        ),
        ChangeNotifierProvider<SubcatigoeyProvider>(
          create: (_) => SubcatigoeyProvider(),
        ),
        ChangeNotifierProvider<FileProvider>(
          create: (_) => FileProvider(),
        ),
      ], child: const MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BottomNavScreen(),
      localizationsDelegates: [
        ...context.localizationDelegates,
        MaterialLocalizationTkDelegate(),
        CupertinoLocalizationTkDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
