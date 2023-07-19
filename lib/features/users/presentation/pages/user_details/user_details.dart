import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';

import '../../../domain/entities/user_details.dart';

class UserDetailsView extends HookWidget {
  final UserDetailsEntity? user;

  const UserDetailsView({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: Builder(
        builder: (context) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => _onBackButtonTapped(context),
          child: const Icon(Ionicons.chevron_back, color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildUserTitle(),
          _buildUserImage(),
        ],
      ),
    );
  }

  Widget _buildUserTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            '${user!.firstName} ${user!.lastName}',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
          ),

          const SizedBox(height: 14),
          // DateTime
          Row(
            children: [
              const Icon(Ionicons.mail, size: 16),
              const SizedBox(width: 4),
              Text(
                user!.email,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUserImage() {
    return Container(
      width: double.maxFinite,
      height: 350,
      margin: const EdgeInsets.only(top: 14),
      child: Image.network(user!.avatar, fit: BoxFit.cover),
    );
  }

  void _onBackButtonTapped(BuildContext context) {
    Navigator.pop(context);
  }
}
