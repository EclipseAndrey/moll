import 'package:flutter/material.dart';
import 'package:moll/generated/l10n.dart';
import 'package:moll/support/styles/colors.dart';
import 'package:moll/support/styles/themes/themes.dart';
import 'package:shimmer/shimmer.dart';


class logo extends StatelessWidget {
  final double? size;
  const logo({Key? key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: C.standartBlack,
        highlightColor: C.purple,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(S.of(context).moll, style: Theme.of(context).textTheme.headline1!.copyWith(fontFamily: MollThemes.fontFamilyMoll, fontSize: size),),
        ));
  }
}
