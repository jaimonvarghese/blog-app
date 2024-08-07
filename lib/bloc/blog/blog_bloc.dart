import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/blog_service.dart';
import 'blog_event.dart';
import 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  BlogBloc() : super(BlogInitial()) {
    on<FetchBlogs>(_fetchBlogs);
  }

  void _fetchBlogs(FetchBlogs event, Emitter<BlogState> emit) async {
    emit(BlogLoading());
    try {
      final blogs = await BlogService.fetchBlogs();
      if (blogs.isNotEmpty) {
        emit(BlogLoaded(blogs));
      } else {
        emit(const BlogError('No blogs available'));
      }
    } catch (e) {
      emit(const BlogError(
          'Could not connect to the server. Please try again later.'));
    }
  }
}
