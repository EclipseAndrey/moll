import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moll/gen/assets.gen.dart';
import 'package:moll/generated/l10n.dart';
import 'package:moll/support/constants/hero_tags.dart';
import 'package:moll/support/wrappers/tap_wrapper.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

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
              S.of(context).info,
              style: Theme.of(context).textTheme.headline3,
            )),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [],
          ),
        ),
      ),
    );
  }
}
