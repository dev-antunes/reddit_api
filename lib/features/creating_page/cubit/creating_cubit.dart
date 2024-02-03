import 'package:api_mock/core/models/post_item.dart';
import 'package:api_mock/repository/api_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'creating_state.dart';

class CreatingCubit extends Cubit<CreatingState> {
  CreatingCubit(this._apiRepository) : super(CreatingInitialState());

  final ApiRepository _apiRepository;

  Future<void> addPost() async {
    try {
      emit(CreatingLoadingState(item: state.item));
      await _apiRepository.create(state.item);
      emit(CreatingSuccessState());
    } catch (exception) {
      emit(CreatingErrorState(
        item: state.item,
        error: 'Error: ${exception.toString()}',
      ));
    }
  }

  Future<void> updatePost() async {
    try {
      emit(CreatingLoadingState(item: state.item));
      await _apiRepository.update(state.item);
      emit(CreatingSuccessState());
    } catch (exception) {
      emit(CreatingErrorState(
        item: state.item,
        error: 'Error: ${exception.toString()}',
      ));
    }
  }

  bool get validToProceed =>
      state.item.author.isNotEmpty && state.item.title.isNotEmpty;

  void onEditionInitiation(PostItem? item) =>
      emit(CreatingInitialState(item: item));

  void onChangeItemAuthor(String author) =>
      emit(CreatingInitialState(item: state.item.copyWith(author: author)));

  void onChangeItemTitle(String title) =>
      emit(CreatingInitialState(item: state.item.copyWith(title: title)));

  void onChangeItemUpNumber(String ups) => emit(
      CreatingInitialState(item: state.item.copyWith(ups: int.tryParse(ups))));

  void onChangeItemCommentNumber(String commentNum) =>
      emit(CreatingInitialState(
          item:
              state.item.copyWith(numberOfComments: int.tryParse(commentNum))));
}
