import 'package:flutter_modular/flutter_modular.dart';

import 'home_controller.dart';
import 'pages/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    Bind((i) => HomeController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => HomePage()),
  ];
  void dispose() => super.dispose();
}
