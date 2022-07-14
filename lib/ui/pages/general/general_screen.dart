import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moll/gen/assets.gen.dart';
import 'package:moll/router/router.gr.dart';
import 'package:moll/support/constants/hero_tags.dart';
import 'package:moll/ui/pages/general/new_connection.dart';
import 'package:moll/ui/widgets/clickable_container.dart';
import 'package:moll/ui/widgets/logo.dart';

class GeneralScreen extends StatefulWidget {
  const GeneralScreen({Key? key}) : super(key: key);

  @override
  _GeneralScreenState createState() => _GeneralScreenState();
}

class _GeneralScreenState extends State<GeneralScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        title: Hero(tag: HeroTags.logo,
            child: logo(context, size: 28)),
        actions: [
          Center(
            child: Hero(
              tag: HeroTags.info,
              child: ClickableContainer(
                  child: SvgPicture.asset(Assets.icons.bootstrapIcons19.info),
                onTap: (){
                    context.router.push(const InfoScreenRoute());
                },
              ),
            ),
          ),
          const SizedBox(width: 16,),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              NewConnectionWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
