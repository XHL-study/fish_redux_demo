
import 'package:fish_redux_demo/pages/index.dart';
import 'package:flutter/material.dart' hide Action;

import 'configs/app_config.dart';
import 'configs/my_router.dart';

Widget createApp() {
  return MaterialApp(
    title: AppConfig.appTitle,
    theme: ThemeData(primaryColor: AppConfig.themeColor),
    home: MyRouter.routes.buildPage(IndexPage.routeName, null),
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute<Object>(builder: (BuildContext context) {
        return MyRouter.routes.buildPage(settings.name, settings.arguments);
      });
    },
  );
}