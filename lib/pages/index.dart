import 'package:fish_redux/fish_redux.dart';
import 'package:fish_redux_demo/pages/list/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'list/page.dart';

class IndexPageState implements Cloneable<IndexPageState> {

  @override
  Color themeColor;

  @override
  IndexPageState clone() {
    // TODO: implement clone
    return null;
  }

}

IndexPageState initState(IndexPageState d){
  return IndexPageState();
}

class IndexPage extends Page<IndexPageState,IndexPageState> {
  static const String routeName = "indexPage";

  IndexPage()
      : super(
          initState: (IndexPageState ips) {
            return IndexPageState();
          },
          view: (dynamic state, Dispatch dis, ViewService viewService) {
            return Scaffold(
              body: Container(
                child: Center(
                  child: FlatButton(
                    onPressed: () {
                      Navigator.of(viewService.context).pushNamed(ListPage.routeName);
                    },
                    child: Text("打开listPage"),
                  ),
                ),
              ),
            );
          },
        );
}
