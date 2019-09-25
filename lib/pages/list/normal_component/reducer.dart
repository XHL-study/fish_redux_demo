

import 'package:fish_redux/fish_redux.dart';
import 'package:fish_redux_demo/pages/list/normal_component/state.dart';

Reducer<NormalComponentState> buildReducer(){
  return asReducer(<Object,Reducer<NormalComponentState>>{

  });
}
