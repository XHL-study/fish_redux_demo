
import 'package:fish_redux/fish_redux.dart';
import 'package:fish_redux_demo/pages/list/adapter/adapter.dart';
import 'package:fish_redux_demo/pages/list/state.dart';
import 'package:fish_redux_demo/pages/list/view.dart';

import 'effect.dart';
import 'reducer.dart';

class ListPage extends Page<ListPageState, ListPageState> {
  static const String routeName = "listPage";

  ListPage()
      : super(
          view: buildView,
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          dependencies: Dependencies<ListPageState>(
            adapter: NoneConn<ListPageState>() + ListPageAdapter(),
          ),
        );
}
