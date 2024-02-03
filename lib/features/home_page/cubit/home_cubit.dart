// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:api_mock/core/models/post_item.dart';
import 'package:api_mock/repository/api_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
    this._apiRepository,
  ) : super(HomeLoadingState());
  final ApiRepository _apiRepository;

  Future<void> onInit() async {
    try {
      emit(HomeLoadingState());
      final result = await _getItems();
      emit(HomeSuccessState(posts: result));
    } catch (exception) {
      emit(HomeErrorState(error: exception.toString()));
    }
  }

  Future<List<PostItem>> _getItems() async => _apiRepository.getAllPosts();

  Future<void> delete(String id) async {
    try {
      emit(HomeLoadingState());
      await _apiRepository.delete(id);
      final result = await _getItems();
      emit(HomeSuccessState(posts: result));
    } catch (exception) {
      emit(HomeErrorState(posts: state.posts, error: exception.toString()));
    }
  }
}
