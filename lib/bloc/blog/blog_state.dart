import 'package:equatable/equatable.dart';

abstract class BlogState extends Equatable {
  const BlogState();

  @override
  List<Object> get props => [];
}

class BlogInitial extends BlogState {}

class BlogLoading extends BlogState {}

class BlogLoaded extends BlogState {
  final List<dynamic> blogs;

  const BlogLoaded(this.blogs);

  @override
  List<Object> get props => [blogs];
}

class BlogError extends BlogState {
  final String message;

  const BlogError(this.message);

  @override
  List<Object> get props => [message];
}
