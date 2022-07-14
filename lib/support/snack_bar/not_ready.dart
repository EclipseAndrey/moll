import 'package:flutter/material.dart';
import 'package:moll/router/router.gr.dart';
import 'package:moll/support/styles/colors.dart';


showNotReadySnackBar(){
  final snackBar = SnackBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: Container(
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
            const Icon(Icons.close, size: 24,),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text('Мы еще работаем над этим :)', style: TextStyle(color: C.standartBlack, fontSize: 14, )),
            ),
          ],
        )
    ),
  );
  ScaffoldMessenger.of(AppRouter().navigatorKey.currentContext!).showSnackBar(snackBar);
}