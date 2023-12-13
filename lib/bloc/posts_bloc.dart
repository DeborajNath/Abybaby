import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:demoproject/bloc/posts_event.dart';
import 'package:demoproject/bloc/posts_state.dart';
import 'package:demoproject/model/post_model.dart';
import 'package:http/http.dart' as http;

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostsInitialFetchEvent>(postsInitialFetchEvent);
  }

  Future<void> postsInitialFetchEvent(
      PostsInitialFetchEvent event, Emitter<PostsState> emit) async {
    var client = http.Client();
    List<PostData> posts = [];
    try {
      var response = await client.get(
        Uri.parse('https://kv.businessenquiry.co.in/api/category'),
      );
      print(response.body);

      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);

        // Ensure the response is a map with 'data' key
        if (responseBody is Map<String, dynamic> &&
            responseBody.containsKey('data')) {
          List<dynamic> result = responseBody['data'];

          for (int i = 0; i < result.length; i++) {
            PostData post = PostData.fromMap(result[i] as Map<String, dynamic>);
            posts.add(post);
          }

          print(posts);
          emit(PostFetchingSuccesfulState(posts: posts));
          print("State emitted successfully");
        } else {
          log('Failed to fetch posts. Invalid response format');
          emit(PostFetchingErrorState());
        }
      } else {
        log('Failed to fetch posts. Status code: ${response.statusCode}');
        emit(PostFetchingErrorState());
      }
    } catch (e) {
      log('Error fetching posts: $e');
      emit(PostFetchingErrorState());
    } finally {
      client.close();
    }
  }
}
