import 'package:clean_and_bloc/features/users/presentation/pages/home/users_list.dart';
import 'package:flutter/material.dart';

import '../../features/users/domain/entities/user_details.dart';
import '../../features/users/presentation/pages/user_details/user_details.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const UsersList());

      case '/UserDetails':
        return _materialRoute(
            UserDetailsView(user: settings.arguments as UserDetailsEntity));

      default:
        return _materialRoute(const UsersList());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
