import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moll/router/router.gr.dart';
import 'package:moll/support/styles/colors.dart';
import 'package:moll/support/wrappers/tap_wrapper.dart';

enum SnackBarType{
  error,
  infoError,
  message,
  awaiting
}



showErrorSnackBar(String text, {Function? onTap, SnackBarType? snackBarType, bool remove = false}){

  IconData? imageIcon = Icons.close;

  switch(snackBarType){
    case SnackBarType.error:
      imageIcon = Icons.close;
      break;
    case SnackBarType.infoError:
       imageIcon = Icons.close;
      break;
    case SnackBarType.message:
      imageIcon = Icons.warning_amber_outlined;
      break;
    case SnackBarType.awaiting:
      imageIcon = Icons.access_time;
      break;
    default : break;
  }


  final snackBar = SnackBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: TapWrapper(
      onTap: (){
        if(onTap != null)onTap();
      },
      child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: C.white,
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.1),
                spreadRadius: 0.0,
                blurRadius: 8.0,
                offset: Offset(2, 4),
              )
            ],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(imageIcon, size: 24,),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(text, style: TextStyle(color: C.standartBlack, fontSize: 14, )),
              ),
            ],
          )
      ),
    ),
  );
  ScaffoldMessenger.of(AppRouter().navigatorKey.currentContext!)..removeCurrentSnackBar()..showSnackBar(snackBar);
}