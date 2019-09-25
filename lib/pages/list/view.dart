import 'package:fish_redux/fish_redux.dart';
import 'package:fish_redux_demo/configs/app_config.dart';
import 'package:fish_redux_demo/global_store/action.dart';
import 'package:fish_redux_demo/global_store/store.dart';
import 'package:fish_redux_demo/pages/list/state.dart';
import 'package:flutter/material.dart' hide Action;

Widget buildView(ListPageState state, Dispatch dispatch, ViewService viewService) {
  final adapter = viewService.buildAdapter();
  return Scaffold(
    appBar: AppBar(
      title: Text("测试 DynamicFlowAdapter"),
      elevation: AppConfig.appBarElevation,
      backgroundColor: state.themeColor,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.color_lens),
          onPressed: () {
            GlobalStore.store.dispatch(GlobalActionCreator.changeThemeColor());
          },
        ),
      ],
    ),
    body: Container(
      child: Column(
        children: <Widget>[
          Text("测试 DynamicFlowAdapter=>{${adapter.itemCount}}"),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: adapter.itemBuilder,
              itemCount: adapter.itemCount,
            ),
          )
        ],
      ),
    ),
  );
}
