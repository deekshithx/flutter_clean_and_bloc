import 'package:clean_and_bloc/config/theme/app_themes.dart';
import 'package:clean_and_bloc/features/users/presentation/bloc/user/remote/remote_user_list_bloc.dart';
import 'package:clean_and_bloc/features/users/presentation/bloc/user/remote/remote_user_list_event.dart';
import 'package:clean_and_bloc/features/users/presentation/pages/home/users_list.dart';
import 'package:clean_and_bloc/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/routes/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteUsersListBloc>(
      create: (context) => sl()..add(const GetUsersList()),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme(),
          onGenerateRoute: AppRoutes.onGenerateRoutes,
          home: const UsersList()),
    );
  }
}
