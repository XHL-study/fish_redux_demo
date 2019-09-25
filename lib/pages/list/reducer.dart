
import 'package:fish_redux/fish_redux.dart';
import 'package:fish_redux_demo/pages/list/state.dart';

import 'action.dart';
import 'normal_component/state.dart';

Reducer<ListPageState> buildReducer() {
  return asReducer(<Object, Reducer<ListPageState>>{ListAction.initData: _initData});
}

ListPageState _initData(ListPageState state, Action action) {
  return state
    ..clone()
    ..list = action.payload ?? <NormalComponentState>[];
}
