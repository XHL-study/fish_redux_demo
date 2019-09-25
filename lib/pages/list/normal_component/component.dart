
import 'package:fish_redux/fish_redux.dart';
import 'package:fish_redux_demo/pages/list/normal_component/effect.dart';
import 'package:fish_redux_demo/pages/list/normal_component/reducer.dart';
import 'package:fish_redux_demo/pages/list/normal_component/state.dart';
import 'package:fish_redux_demo/pages/list/normal_component/view.dart';

class NormalComponent extends Component<NormalComponentState> {
  static const String componentName = "NormalComponent";
  NormalComponent()
      : super(
          reducer: buildReducer(),
          effect: buildEffect(),
          view: buildView,
        );
}
