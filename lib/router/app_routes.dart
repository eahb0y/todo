import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/home/presentation/bloc/home_bloc.dart';
import 'package:todo/features/home/presentation/page/home_page.dart';
import 'package:todo/features/initial/presentation/page/initial_page.dart';
import 'package:todo/injector_container.dart';
import 'package:todo/router/name_routes.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellRootNavigatorKey = GlobalKey<NavigatorState>();

class AppRoutes {
  AppRoutes._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    if (kDebugMode) {
      print("route : ${settings.name}");
    }
    switch (settings.name) {
      case Routes.initial:
        return MaterialPageRoute(builder: (_) => const InitialPage());
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>(
            create: (_) => sl<HomeBloc>(),
            child: const HomePage(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>(
            create: (context) => sl<HomeBloc>(),
            child: HomePage(),
          ),
        );
    }
  }
}
