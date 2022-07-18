import 'package:flutter/material.dart';
import 'package:moll/generated/l10n.dart';

class Empty extends StatelessWidget {
  const Empty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(S.of(context).empty, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyText2,),
      ),
    );
  }
}
