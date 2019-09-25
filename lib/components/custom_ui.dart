import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class CustomUI {
  ///弹出框 - 确认框
  ///返回值：yes,no
  static Future<String> uAlert(
    Context ctx, {
    String title = "提示",
    String content = "",
    String cancelText = "取消",
    String confirmText = "确认",
    Color cancelTextColor = Colors.white,
    Color cancelBgColor,
    Color confirmTextColor = Colors.white,
    Color confirmBgColor,
  }) async {
    cancelBgColor = cancelBgColor ?? Theme.of(ctx.context).primaryColor;
    confirmBgColor = confirmBgColor ?? cancelBgColor;

    return await showDialog<String>(
        context: ctx.context,
        builder: (BuildContext buildContext) {
          return SafeArea(
              child: AlertDialog(
            titlePadding: EdgeInsets.all(8.0),
            contentPadding: EdgeInsets.all(8.0),
            title: Text(title),
            content: Container(
              child: Text(content),
            ),
            actions: <Widget>[
              RaisedButton(
                elevation: 0,
                color: cancelBgColor,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.cancel,
                      color: confirmTextColor,
                    ),
                    Text(cancelText, style: TextStyle(color: cancelTextColor)),
                  ],
                ),
                onPressed: () {
                  Navigator.of(buildContext).pop('no');
                },
              ),
              RaisedButton(
                elevation: 0,
                color: confirmBgColor,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.subdirectory_arrow_left,
                      color: confirmTextColor,
                    ),
                    Text(confirmText, style: TextStyle(color: confirmTextColor)),
                  ],
                ),
                onPressed: () {
                  Navigator.of(buildContext).pop('yes');
                },
              ),
            ],
          ));
        });
  }
}
