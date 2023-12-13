import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:demoproject/bloc/posts_bloc.dart';
import 'package:demoproject/bloc/posts_event.dart';
import 'package:demoproject/bloc/posts_state.dart';
import 'package:demoproject/utils/widgets/drawer.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        print('PostsBloc initialized');
        return PostsBloc()..add(PostsInitialFetchEvent());
      },
      child: _DashboardContent(),
    );
  }
}

class _DashboardContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Dashboard widget is being rebuilt');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      drawer: NavigationDrawers(),
      body: BlocConsumer<PostsBloc, PostsState>(
        listenWhen: (previous, current) => true,
        buildWhen: (previous, current) => current is! PostsActionState,
        listener: (context, state) {
          // Do any additional processing if needed
        },
        builder: (context, state) {
          print('Dashboard content rebuilt with state: $state');
          if (state is PostFetchingSuccesfulState) {
            final successState = state;
            print('Number of posts: ${successState.posts.length}');

            return Container(
              child: ListView.builder(
                itemCount: successState.posts.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 150,
                    width: 100,
                    child: Column(
                      children: [
                        Image.network(
                          successState.posts[index]
                              .icon, // Assuming 'icon' contains the image URL
                          width: 50,
                          height: 50,
                        ),
                        Text(successState.posts[index].category),
                        Text(successState.posts[index].lnBn),
                        Text(successState.posts[index].lnHn)
                      ],
                    ),
                  );
                },
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
