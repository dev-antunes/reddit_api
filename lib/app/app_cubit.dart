import 'package:api_mock/app/app_state.dart';
import 'package:api_mock/core/enums.dart';
import 'package:api_mock/core/l10n/generated/l10n.dart';
import 'package:api_mock/core/models/post_item.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit()
      : super(
          const AppState(0, Locale.fromSubtags(languageCode: 'en')),
        );

  void navigatePage(int newPage, {PostItem? postItem}) =>
      emit(AppState(newPage, state.locale, postItem: postItem));

  Future<void> onSwitchLanguage(Language language) async {
    final Locale locale;
    switch (language) {
      case Language.en:
        locale = const Locale.fromSubtags(languageCode: 'en');
        break;
      case Language.pt:
        locale = const Locale.fromSubtags(languageCode: 'pt');
        break;
    }
    AppLocalizations.delegate.load(locale);
    emit(AppState(state.index, locale));
  }
}
