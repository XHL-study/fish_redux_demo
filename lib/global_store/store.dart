import 'package:fish_redux/fish_redux.dart';
import 'package:fish_redux_demo/global_store/reducer.dart';
import 'package:fish_redux_demo/global_store/state.dart';

///
/// 全局store
///

class GlobalStore {
  static Store<GlobalState> _globalStore;

  static Store<GlobalState> get store => _globalStore ??= createStore<GlobalState>(GlobalState(), buildReducer());
}
