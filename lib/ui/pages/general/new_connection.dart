import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moll/bloc/new_connect/new_connect_bloc.dart';
import 'package:moll/generated/l10n.dart';
import 'package:moll/support/styles/colors.dart';
import 'package:moll/ui/widgets/clickable_container.dart';

class NewConnectionWidget extends StatelessWidget {
  const NewConnectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewConnectBloc,NewConnectState>(
      bloc: BlocProvider.of<NewConnectBloc>(context),
      builder: (context, state) {
        if(state is NewConnectEmptyState){
          return _buildEmptyState(context);
        }else if(state is NewConnectLoadingState){
          return _buildLoadingState(context);
        }
        return _buildErrorState(context);
      }
    );
  }



  Widget _buildEmptyState(BuildContext context){
    return ClickableContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(S.of(context).devices_not_found, style: Theme.of(context).textTheme.bodyText2,),
        ],
      )
    );
  }


  Widget _buildLoadingState(BuildContext context){
    return ClickableContainer(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(S.of(context).search_devices, style: Theme.of(context).textTheme.bodyText2,),
          ],
        )
    );
  }
  Widget _buildErrorState(BuildContext context){
    return ClickableContainer(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(S.of(context).error, style: Theme.of(context).textTheme.bodyText2,),
          ],
        )
    );
  }



}
