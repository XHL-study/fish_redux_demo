import 'package:fish_redux/fish_redux.dart';
import 'package:fish_redux_demo/global_store/state.dart';
import 'package:fish_redux_demo/global_store/store.dart';
import 'package:fish_redux_demo/pages/index.dart';
import 'package:fish_redux_demo/pages/list/page.dart';

import 'app_config.dart';

//路由
class MyRouter {
  //路由集合
  static final Map<String, Page<Object, dynamic>> _routes = {
    ListPage.routeName: ListPage(),
    IndexPage.routeName: IndexPage(),
  };

  //路由管理
  static final AbstractRoutes routes = PageRoutes(
    pages: _routes,
    visitor: (String path, Page<Object, dynamic> page) {
      /// 只有特定范围的Page才需要建立和AppStore的连接关系
      if (page.isTypeof<GlobalBaseState>()) {
        page.connectExtraStore<GlobalState>(
          GlobalStore.store,
          (Object pageState, GlobalState appState) {
            final GlobalBaseState p = pageState;
            //更改主题
            if (p.themeColor != appState.themeColor) {
              if (pageState is Cloneable) {
                final Object copy = pageState.clone();
                final GlobalBaseState newState = copy;
                newState.themeColor = appState.themeColor;
                return newState;
              }
            }

            ///初始化主题
            if (p.themeColor == null) {
              if (pageState is Cloneable) {
                final Object copy = pageState.clone();
                final GlobalBaseState newState = copy;
                newState.themeColor = appState.themeColor ?? AppConfig.themeColor;
                return newState;
              }
            }
            return p;
          },
        );
      }

      page.enhancer.append(
        /// View AOP
        viewMiddleware: <ViewMiddleware<dynamic>>[
          safetyView<dynamic>(),
        ],

        /// Adapter AOP
        adapterMiddleware: <AdapterMiddleware<dynamic>>[safetyAdapter<dynamic>()],

        /// Effect AOP
        effectMiddleware: [
          _pageAnalyticsMiddleware<dynamic>(),
        ],

        /// Store AOP
        middleware: <Middleware<dynamic>>[
          logMiddleware<dynamic>(tag: page.runtimeType.toString()),
        ],
      );
    },
  );
}

/// 简单的Effect AOP
/// 只针对页面的生命周期进行打印
EffectMiddleware<T> _pageAnalyticsMiddleware<T>({String tag = 'redux'}) {
  return (AbstractLogic<dynamic> logic, Store<T> store) {
    return (Effect<dynamic> effect) {
      return (Action action, Context<dynamic> ctx) {
        if (logic is Page<dynamic, dynamic> && action.type is Lifecycle) {
          print('${logic.runtimeType} <-> ${action.type.toString()} ');
        }
        return effect?.call(action, ctx);
      };
    };
  };
}
