import 'package:flutter/material.dart';

class TapWrapper extends StatefulWidget {
  final Function? onTap;
  final Function? onLongPress;

  final Widget child;
  const TapWrapper({Key? key, this.onTap, required this.child, this.onLongPress }) : super(key: key);

  @override
  _TapWrapperState createState() => _TapWrapperState();
}

class _TapWrapperState extends State<TapWrapper> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).splashColor,
      onTap: (){
        if(widget.onTap != null){widget.onTap!();}
      },
      onLongPress: (){
        if(widget.onLongPress != null){widget.onLongPress!();}

      },
      child: widget.child,
    );
  }
}
