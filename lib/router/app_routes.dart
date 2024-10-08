import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/add_event/presentation/argument/add_event_argument.dart';
import 'package:todo/features/add_event/presentation/bloc/add_event_bloc.dart';
import 'package:todo/features/add_event/presentation/page/add_event_page.dart';
import 'package:todo/features/event_page/presentation/argument/event_page_argument.dart';
import 'package:todo/features/event_page/presentation/bloc/event_bloc.dart';
import 'package:todo/features/event_page/presentation/page/event_page.dart';
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
      case Routes.addEvent:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<AddEventBloc>(
            create: (context) => sl<AddEventBloc>(),
            child: AddEventPage(
              argument: settings.arguments is AddEventArgument
                  ? settings.arguments as AddEventArgument
                  : null,
            ),
          ),
        );
      case Routes.event:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<EventBloc>(
                  create: (context) => sl<EventBloc>(),
                  child: EventPage(
                    argument: settings.arguments is EventPageArgument
                        ? settings.arguments as EventPageArgument
                        : null,
                  ),
                ));
      default:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeBloc>(
            create: (context) => sl<HomeBloc>(),
            child: const HomePage(),
          ),
        );
    }
  }
}
