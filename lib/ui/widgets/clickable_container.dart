import 'package:flutter/material.dart';
import 'package:moll/support/styles/colors.dart';

class ClickableContainer extends StatelessWidget {
  final Widget child;
  final Function? onTap;
  const ClickableContainer({Key? key, required this.child, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(12)),

        child: InkWell(
          onTap: (){
            if(onTap != null)onTap!();
          },
            splashColor: C.white,
            highlightColor: C.purple.withOpacity(0.01),
            // hoverColor: Colors.purple,
            // focusColor: Colors.red,
            // hoverColor: ,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: C.purple.withOpacity(0.1)),
                  borderRadius: const BorderRadius.all(Radius.circular(12))
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: child,
              ),
            )
        ),
      ),
    );
  }
}
