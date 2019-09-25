import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:fish_redux_demo/global_store/state.dart';

import 'normal_component/state.dart';

class ListPageState implements GlobalBaseState, Cloneable<ListPageState> {

  List<NormalComponentState> list = [];

  @override
  Color themeColor;

  @override
  ListPageState clone() {
    return ListPageState()..themeColor = themeColor..list = list;
  }
}

ListPageState initState(ListPageState list){
  return ListPageState();
}