import 'dart:math';
import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:fish_redux_demo/global_store/state.dart';
import 'package:flutter/material.dart' hide Action;

import 'action.dart';

Reducer<GlobalState> buildReducer() {
  return asReducer(
    <Object, Reducer<GlobalState>>{
      GlobalAction.changeThemeColor: _changeThemeColor,
    },
  );
}

const List<Color> colorList = <Color>[
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.blueAccent,
];

GlobalState _changeThemeColor(GlobalState state, Action action) {
  if (action?.payload is Color) {
    return state.clone()..themeColor = action.payload;
  }
  return state.clone()..themeColor = colorList[Random().nextInt(colorList.length)];
}

