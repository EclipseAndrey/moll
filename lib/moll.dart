import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:moll/bloc/new_connect/new_connect_bloc.dart';
import 'package:moll/generated/l10n.dart';
import 'package:moll/router/router.gr.dart';
import 'package:moll/support/styles/themes/themes.dart';


class MollApp extends StatefulWidget {
  const MollApp({Key? key}) : super(key: key);

  @override
  _MollAppState createState() => _MollAppState();
}

class _MollAppState extends State<MollApp>  with WidgetsBindingObserver{
  final _appRouter = AppRouter();


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider<NewConnectBloc>(
          create: (context) => NewConnectBloc()..add(NewConnectSearchEvent()),
        ),
      ],
      child: MaterialApp.router(
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        debugShowCheckedModeBanner: false,
        theme: MollThemes.dark,
        /// Localization
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,


      ),
    );
  }


}
