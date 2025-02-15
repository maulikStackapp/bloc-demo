import 'package:bloc_demo/blocs/sub_post_bloc/sub_post_bloc.dart';
import 'package:bloc_demo/blocs/sub_post_bloc/sub_post_event.dart';
import 'package:bloc_demo/blocs/sub_post_bloc/sub_post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubPostScreen extends StatefulWidget {
  final int userId;

  const SubPostScreen({super.key, required this.userId});

  @override
  State<SubPostScreen> createState() => _SubPostScreenState();
}

class _SubPostScreenState extends State<SubPostScreen> {
  @override
  void initState() {
    init();
    super.initState();
  }

  void init() => context.read<SubPostBloc>().add(GetDataEvent(id: widget.userId));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.userId}')),
      body: BlocListener<SubPostBloc, SubPostState>(
        listener: (context, state) {
          if (state is SubPostDataLoaded) {
            if (state.userList.title != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Data Updated'),
                  duration: Duration(seconds: 2),
                ),
              );
            }
          }
        },
        child: BlocBuilder<SubPostBloc, SubPostState>(
          builder: (context, state) {
            if (state is SubPostDataLoaded) {
              return ListTile(
                title: Text(
                  state.userList.title ?? '',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
                subtitle: Text(state.userList.body ?? ''),
              );
            } else if (state is SubPostDataLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is SubPostDataError) {
              return Center(child: Text(state.message));
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
