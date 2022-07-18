import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moll/bloc/info_host/info_host_bloc.dart';
import 'package:moll/bloc/scan/scan_bloc.dart';
import 'package:moll/gen/assets.gen.dart';
import 'package:moll/generated/l10n.dart';
import 'package:moll/models/host_item.dart';
import 'package:moll/router/router.gr.dart';
import 'package:moll/support/constants/hero_tags.dart';
import 'package:moll/support/styles/colors.dart';
import 'package:moll/support/wrappers/tap_wrapper.dart';
import 'package:moll/ui/widgets/clickable_container.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {

  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  List<HostItem> hosts = [];

  @override
  void initState() {
    BlocProvider.of<ScanBloc>(context).add(ScanStartEvent());
    if(BlocProvider.of<ScanBloc>(context).state is ScanResultState){
       (BlocProvider.of<ScanBloc>(context).state as ScanResultState).hosts.forEach((element) {
         hosts.add(HostItem(ip: element.ip, number: ''));
       });
    }

    super.initState();
  }

  @override
  void deactivate() {
    BlocProvider.of<ScanBloc>(context).add(ScanStopEvent());
    super.deactivate();
  }

  // @override
  // void dispose() {
  //   BlocProvider.of<ScanBloc>(context).add(ScanStopEvent());
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        leading: Center(
            child: TapWrapper(
                onTap: () {
                  context.router.pop();
                },
                child: SvgPicture.asset(
                  Assets.icons.bootstrapIcons19.arrowLeftShort,
                  width: 24,
                  height: 24,
                ))),
        title: Hero(
            tag: HeroTags.logo,
            child: Text(
              S.of(context).moll,
              style: Theme.of(context).textTheme.headline3,
            )),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(S.of(context).result_devices, style: Theme.of(context).textTheme.bodyText2,),
              SizedBox(height: 16,),
              BlocBuilder<ScanBloc,ScanState>(
                bloc: BlocProvider.of<ScanBloc>(context),
                builder: (context,state) {
                  if(state is ScanResultState) {
                    hosts.add(HostItem(ip: state.newHost.ip, number: ''));
                    _listKey.currentState?.insertItem(hosts.length-1, duration: const Duration(milliseconds: 100));
                    return AnimatedList(
                      shrinkWrap: true,
                        primary: false,
                        initialItemCount: hosts.length,
                        key: _listKey,
                        itemBuilder: (context, index,
                            Animation<double> animation) {
                          return ScaleTransition(
                              scale: animation,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: ClickableContainer(
                                  onTap: (){
                                    BlocProvider.of<ScanBloc>(context).add(ScanStopEvent());
                                    BlocProvider.of<InfoHostBloc>(context).add(InfoHostStartEvent(hosts[index].ip));
                                    context.router.push(const HostInfoScreenRoute());
                                  },
                                  child: Row(
                                    children: [
                                      Text(hosts[index].ip, style: Theme.of(context).textTheme.bodyText2,),
                                    ],
                                  ),
                                ),
                              ));
                        });
                  }
                  return const SizedBox( );
                }
              )
            ],
          ),
        ),
      ),
    );
  }



}
