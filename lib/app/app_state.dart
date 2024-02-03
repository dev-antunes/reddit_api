import 'package:api_mock/core/models/post_item.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

final class AppState extends Equatable {
  const AppState(this.index, this.locale, {this.postItem});

  final int index;
  final PostItem? postItem;
  final Locale locale;

  @override
  List<Object?> get props => [index, postItem, locale];
}
