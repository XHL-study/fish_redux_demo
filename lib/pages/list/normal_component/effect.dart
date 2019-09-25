
import 'package:fish_redux/fish_redux.dart';
import 'package:fish_redux_demo/components/custom_ui.dart';
import 'package:fish_redux_demo/pages/list/normal_component/state.dart';
import 'package:flutter/material.dart' as prefix0;

import 'action.dart';

Effect<NormalComponentState> buildEffect() {
  return combineEffects(<Object, Effect<NormalComponentState>>{
    NormalComponentAction.onRemoveItem: _onRemoveItem,
  });
}

void _onRemoveItem(Action action, Context<NormalComponentState> ctx) async {
  final String res = await CustomUI.uAlert(ctx, title: "警告", content: "确认删除该医生吗？");
  if (res == 'yes') {
    prefix0.debugPrint("remove item=>${ctx.state.toString()}");
    ctx.dispatch(NormalComponentActionCreator.removeItem(action.payload));
  }
}
