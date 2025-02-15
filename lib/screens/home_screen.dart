import 'package:bloc_demo/blocs/post_bloc/post_bloc.dart';
import 'package:bloc_demo/blocs/post_bloc/post_event.dart';
import 'package:bloc_demo/blocs/post_bloc/post_state.dart';
import 'package:bloc_demo/screens/sub_post_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    init();
    super.initState();
  }

  void init() {
    context.read<PostBloc>().add(GetPostEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BloC Demo")),
      body: Center(
        child: BlocListener<PostBloc, PostState>(
          listener: (context, state) {
            if (state is GetPostDataLoaded) {
              if (state.postList.isNotEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Data Updated'),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            }
          },
          child: BlocBuilder<PostBloc, PostState>(
            builder: (context, state) {
              if (state is GetPostDataLoaded) {
                return ListView.builder(
                  itemCount: state.postList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SubPostScreen(userId: state.postList[index].id ?? 0))),
                      title: Text(
                        '${state.postList[index].title}',
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      subtitle: Text('${state.postList[index].body}'),
                    );
                  },
                );
              } else if (state is GetPostDataLoading) {
                return const CircularProgressIndicator();
              } else if (state is GetPostDataError) {
                return Center(child: Text(state.message));
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
