import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/injection/bloc_factory.dart';
import 'package:weather_app/injection/modules.dart';
import 'package:weather_app/routing/router.gr.dart' as rgr;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  GetIt injector = GetIt.instance;
  registerModules(injector);
  runApp(MultiProvider(
    providers: [
      Provider<BlocFactory>(
          create: (context) => BlocFactory(injector: injector)),
    ],
    child: EasyLocalization(
      supportedLocales: [Locale('en')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  final GlobalKey<ExtendedNavigatorState> _routerKey =
  GlobalKey<ExtendedNavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ExtendedNavigator<rgr.Router>(
        key: _routerKey,
        router: rgr.Router(),
      ),
    );
  }
}
