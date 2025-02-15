import 'package:bloc_demo/blocs/post_bloc/post_bloc.dart';
import 'package:bloc_demo/repository/data_repository.dart';
import 'package:bloc_demo/blocs/sub_post_bloc/sub_post_bloc.dart';
import 'package:bloc_demo/repository/sub_post_repository.dart';
import 'package:bloc_demo/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => UserRepository()),
        RepositoryProvider(create: (context) => SubPostRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => PostBloc(userRepository: context.read<UserRepository>())),
          BlocProvider(create: (context) => SubPostBloc(subPostRepository: context.read<SubPostRepository>())),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
