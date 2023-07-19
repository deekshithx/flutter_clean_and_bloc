import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/user_details.dart';
import '../../bloc/user/remote/remote_user_list_bloc.dart';
import '../../bloc/user/remote/remote_user_list_event.dart';
import '../../bloc/user/remote/remote_user_list_state.dart';
import '../../widgets/user_tile.dart';

class UsersList extends StatefulWidget {
  const UsersList({Key? key}) : super(key: key);

  @override
  _UsersListState createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  final ScrollController _scrollController = ScrollController();
  late RemoteUsersListBloc _usersListBloc;

  @override
  void initState() {
    super.initState();
    _usersListBloc = BlocProvider.of<RemoteUsersListBloc>(context);
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            0.8 * _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      _usersListBloc.add(const GetUsersList());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(),
    );
  }

  _buildAppbar(BuildContext context) {
    return AppBar(
      title: const Text(
        'Users List',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<RemoteUsersListBloc, RemoteUsersListState>(
      builder: (context, state) {
        if (state.userList != null &&
            state is RemoteUsersListLoading &&
            state.userList!.isEmpty) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state.userList != null && state is RemoteUsersListError) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.refresh),
                SizedBox(height: 8.0),
                Text('Error while fetching users'),
              ],
            ),
          );
        }
        if (state is RemoteUsersListDone) {
          return SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                ...state.userList!
                    .map((user) => UsersListWidget(
                          user: user,
                          onTilePressed: (user) =>
                              _onTilePressed(context, user),
                        ))
                    .toList(),
                (state.isEnd ?? true)
                    ? const Text('\nThat\'s all folks 🍻\n')
                    : const Text('\nLoading...\n')
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  void _onTilePressed(BuildContext context, UserDetailsEntity user) {
    Navigator.pushNamed(context, '/UserDetails', arguments: user);
  }
}
