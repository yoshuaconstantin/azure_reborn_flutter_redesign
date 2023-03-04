import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/profile_screen_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<ProfileScreenBloc, ProfileScreenState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        child: Container(),
      ),
    );
  }
}
