import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moll/bloc/info_host/info_host_bloc.dart';
import 'package:moll/gen/assets.gen.dart';
import 'package:moll/generated/l10n.dart';
import 'package:moll/support/constants/hero_tags.dart';
import 'package:moll/support/wrappers/tap_wrapper.dart';

import 'states/empty.dart';
import 'states/error_host.dart';
import 'states/loading.dart';
import 'states/view_host.dart';

class HostInfoScreen extends StatelessWidget {
  const HostInfoScreen({Key? key}) : super(key: key);

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
            child: BlocBuilder<InfoHostBloc, InfoHostState>(
              bloc: BlocProvider.of<InfoHostBloc>(context),
              builder: (context, state) {
                if(state is InfoHostEmptyState){
                  return Text(
                    S.of(context).empty,
                    style: Theme.of(context).textTheme.headline3,
                  );
                } else if (state is InfoHostLoadingState){
                  return Text(
                    state.name,
                    style: Theme.of(context).textTheme.headline3,
                  );
                } else if (state is InfoHostErrorState){
                  return Text(
                    S.of(context).error,
                    style: Theme.of(context).textTheme.headline3,
                  );
                } else if (state is InfoHostResultState){
                  return Text(
                    state.host.name??state.host.ip,
                    style: Theme.of(context).textTheme.headline3,
                  );
                }
                return Text(
                  S.of(context).moll,
                  style: Theme.of(context).textTheme.headline3,
                );
              }
            )),
      ),

      body: BlocBuilder<InfoHostBloc, InfoHostState>(
          bloc: BlocProvider.of<InfoHostBloc>(context),
          builder: (context, state) {
            if(state is InfoHostEmptyState){
              return const Empty();
            } else if (state is InfoHostLoadingState){
              return const Loading();
            } else if (state is InfoHostErrorState){
              return const ErrorHost();
            } else if (state is InfoHostResultState){
              return const ViewHost();
            }
              return const ErrorHost();
          }
      ),

    );
  }
}
