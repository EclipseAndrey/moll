import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:moll/bloc/info_host/info_host_bloc.dart';
import 'package:moll/bloc/new_connect/new_connect_bloc.dart';
import 'package:moll/bloc/scan/scan_bloc.dart';
import 'package:moll/controllers/wss_constroller.dart';
import 'package:moll/controllers/wss_controller_interface.dart';
import 'package:moll/generated/l10n.dart';
import 'package:moll/repositories/scan_repository/scan_repository.dart';
import 'package:moll/repositories/scan_repository/scan_repository_interface.dart';
import 'package:moll/repositories/wss_repository/wss_repository.dart';
import 'package:moll/repositories/wss_repository/wss_repository_interface.dart';
import 'package:moll/router/router.gr.dart';
import 'package:moll/services/scan_service/scan_service.dart';
import 'package:moll/services/scan_service/scan_service_interface.dart';
import 'package:moll/services/wss_service/wss_service.dart';
import 'package:moll/services/wss_service/wss_service_interface.dart';
import 'package:moll/support/styles/themes/themes.dart';


class MollApp extends StatefulWidget {
  const MollApp({Key? key}) : super(key: key);

  @override
  _MollAppState createState() => _MollAppState();
}

class _MollAppState extends State<MollApp>  with WidgetsBindingObserver{
  final _appRouter = AppRouter();


  ///Services
  late ScanServiceInterface _scanService;
  late WSSServiceInterface _wssService;

  ///Repo
  late ScanRepositoryInterface _scanRepository;
  late WSSRepositoryInterface _wssRepository;


  late WSSControllerInterface _wssController;


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);


    ///Services
    _scanService = ScanService();
    _wssService = WSSService();

    ///Repositories
    _scanRepository = ScanRepository(scanService: _scanService);
    _wssRepository = WSSRepository(wssService: _wssService);


    _wssController = WSSController(wssService: _wssService);


  }





  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers:[
          RepositoryProvider<ScanRepositoryInterface>.value(
            value: _scanRepository,
          ),
          RepositoryProvider<WSSRepositoryInterface>.value(
            value: _wssRepository,
          ),
          RepositoryProvider<WSSControllerInterface>.value(
            value: _wssController,
          ),
        ],
      child: MultiBlocProvider(
        providers:[
          BlocProvider<NewConnectBloc>(
            create: (context) => NewConnectBloc()..add(NewConnectSearchEvent()),
          ),
          BlocProvider<InfoHostBloc>(
            create: (context) => InfoHostBloc(wssController: _wssController, wssRepository: _wssRepository),
          ),
          BlocProvider<ScanBloc>(
              create: (context) => ScanBloc(scanRepository: _scanRepository)..add(ScanStartEvent())),
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
      ),
    );
  }


}
