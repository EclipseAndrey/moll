import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moll/gen/assets.gen.dart';
import 'package:moll/generated/l10n.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =  AnimationController(
      vsync: this,
      duration:  const Duration(seconds: 9),
    );

    animationController.repeat();
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        // child: SvgPicture.asset(Assets.icons.settings),
        // child: Text(S.of(context).check, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyText2,),
          child:  Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedBuilder(
                animation: animationController,
                builder: (BuildContext context, Widget? widget) {
                  return  Transform.rotate(
                    angle: animationController.value * 6.3,
                    child: widget,
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    AnimatedBuilder(
                      animation: animationController,
                      child:  SvgPicture.asset(Assets.icons.settings),
                      builder: (BuildContext context, Widget? widget) {
                        return  Transform.rotate(
                          angle: animationController.value * 20.3,
                          child: widget,
                        );
                      },
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedBuilder(
                          animation: animationController,
                          child:  SvgPicture.asset(Assets.icons.settings),
                          builder: (BuildContext context, Widget? widget) {
                            return  Transform.rotate(
                              angle: animationController.value * 20.3,
                              child: widget,
                            );
                          },
                        ),
                        AnimatedBuilder(
                          animation: animationController,
                          child:  SvgPicture.asset(Assets.icons.settings),
                          builder: (BuildContext context, Widget? widget) {
                            return  Transform.rotate(
                              angle: animationController.value * -20.3,
                              child: widget,
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24,),

              Text(S.of(context).check, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyText2,),

              const SizedBox(height: 48,),

            ],
          )
      ),
    );
  }
}
