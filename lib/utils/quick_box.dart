import 'package:flutter/material.dart';

runQuickBox({required BuildContext context, required String message,int ? duration}) {
  WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
    showDialog(
        barrierDismissible: false,
        barrierColor: Colors.transparent,
        context: context,
        builder: (context) {
          if (duration==null) {
            Future.delayed(const Duration(milliseconds: 1000), () {
              Navigator.maybePop(context);
            });
          }
          else if (duration==5){
            Future.delayed(const Duration(milliseconds: 5000), () {
              Navigator.maybePop(context);
            });
          }
          else if (duration==3){
            Future.delayed(const Duration(milliseconds: 3000), () {
              Navigator.maybePop(context);
            });

          }else if (duration==2){
            Future.delayed(const Duration(milliseconds: 2000), () {
              Navigator.maybePop(context);
            });

          }
          return AlertDialog(
            title: Text(
              message,
              textAlign: TextAlign.center,
            ),
          );
        });
  });
}