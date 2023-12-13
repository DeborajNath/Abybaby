import 'package:flutter/material.dart';
import 'package:demoproject/model/post_model.dart';

@immutable
abstract class PostsState {}

abstract class PostsActionState extends PostsState {}

class PostsInitial extends PostsState {}

class PostFetchingSuccesfulState extends PostsState {
  final List<PostData> posts;
  PostFetchingSuccesfulState({
    required this.posts,
  });
}

class PostFetchingErrorState extends PostsState {}
