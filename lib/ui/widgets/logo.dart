import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moll/generated/l10n.dart';
import 'package:moll/support/styles/colors.dart';
import 'package:moll/support/styles/themes/themes.dart';
import 'package:shimmer/shimmer.dart';

Widget logo(BuildContext context, {double? size}){
  return Shimmer.fromColors(
      baseColor: C.standartBlack,
      highlightColor: C.purple,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(S.of(context).moll, style: Theme.of(context).textTheme.headline1!.copyWith(fontFamily: MollThemes.fontFamilyMoll, fontSize: size),),
      ));
}