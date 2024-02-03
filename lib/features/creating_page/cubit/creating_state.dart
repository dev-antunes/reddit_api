part of 'creating_cubit.dart';

abstract class CreatingState extends Equatable {
  const CreatingState({required this.item, this.error});

  final PostItem item;
  final String? error;

  @override
  List<Object?> get props => [item];
}

final class CreatingInitialState extends CreatingState {
  CreatingInitialState({PostItem? item})
      : super(item: item ?? _defaultPostItem);
}

final class CreatingSuccessState extends CreatingState {
  CreatingSuccessState() : super(item: _defaultPostItem);
}

final class CreatingLoadingState extends CreatingState {
  const CreatingLoadingState({required super.item});
}

final class CreatingErrorState extends CreatingState {
  const CreatingErrorState({required super.item, required super.error});
}

PostItem get _defaultPostItem => PostItem(
      title: '',
      author: '',
      ups: 0,
      numberOfComments: 0,
      createdAt: DateTime.now(),
    );
