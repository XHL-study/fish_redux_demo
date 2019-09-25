import 'package:fish_redux/fish_redux.dart';

import 'normal_component/state.dart';

enum ListAction { initData }

class ListActionCreator {
  static Action initData(List<NormalComponentState> list) {
    return Action(ListAction.initData, payload: list);
  }
}
