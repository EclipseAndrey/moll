import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:moll/generated/l10n.dart';
import 'package:moll/router/router.gr.dart';
import 'package:moll/support/constants/hero_tags.dart';
import 'package:moll/support/styles/colors.dart';
import 'package:moll/support/styles/themes/themes.dart';
import 'package:moll/ui/widgets/logo.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    goToHome();
  }


  goToHome()async{
    await Future.delayed(const Duration(milliseconds: 700));
    context.router.replace(const GeneralScreenRoute());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Hero(
                tag: HeroTags.logo,
                child: logo()),
          ],
        ),
      ),
    );
  }
}
