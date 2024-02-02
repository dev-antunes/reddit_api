// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class AppLocalizations {
  AppLocalizations();

  static AppLocalizations? _current;

  static AppLocalizations get current {
    assert(_current != null,
        'No instance of AppLocalizations was loaded. Try to initialize the AppLocalizations delegate before accessing AppLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalizations();
      AppLocalizations._current = instance;

      return instance;
    });
  }

  static AppLocalizations of(BuildContext context) {
    final instance = AppLocalizations.maybeOf(context);
    assert(instance != null,
        'No instance of AppLocalizations present in the widget tree. Did you add AppLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Your feed`
  String get yourFeed {
    return Intl.message(
      'Your feed',
      name: 'yourFeed',
      desc: '',
      args: [],
    );
  }

  /// `Editing`
  String get editing {
    return Intl.message(
      'Editing',
      name: 'editing',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edid {
    return Intl.message(
      'Edit',
      name: 'edid',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Add to list`
  String get addToList {
    return Intl.message(
      'Add to list',
      name: 'addToList',
      desc: '',
      args: [],
    );
  }

  /// `Author`
  String get author {
    return Intl.message(
      'Author',
      name: 'author',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get title {
    return Intl.message(
      'Title',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Number of comments`
  String get comment {
    return Intl.message(
      'Number of comments',
      name: 'comment',
      desc: '',
      args: [],
    );
  }

  /// `number of ups`
  String get ups {
    return Intl.message(
      'number of ups',
      name: 'ups',
      desc: '',
      args: [],
    );
  }

  /// `Options`
  String get options {
    return Intl.message(
      'Options',
      name: 'options',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Select your language`
  String get selectYourLanguage {
    return Intl.message(
      'Select your language',
      name: 'selectYourLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Portuguese`
  String get portuguese {
    return Intl.message(
      'Portuguese',
      name: 'portuguese',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to set language to {language}`
  String setLanguageConfimation(String language) {
    return Intl.message(
      'Are you sure you want to set language to $language',
      name: 'setLanguageConfimation',
      desc: '',
      args: [language],
    );
  }

  /// `Time's up`
  String get timesUp {
    return Intl.message(
      'Time\'s up',
      name: 'timesUp',
      desc: '',
      args: [],
    );
  }

  /// `You have been away fior a while, budy.`
  String get away {
    return Intl.message(
      'You have been away fior a while, budy.',
      name: 'away',
      desc: '',
      args: [],
    );
  }

  /// `Error on resume app: {error}`
  String resumeAppError(String error) {
    return Intl.message(
      'Error on resume app: $error',
      name: 'resumeAppError',
      desc: '',
      args: [error],
    );
  }

  /// `Take a picture`
  String get takePicture {
    return Intl.message(
      'Take a picture',
      name: 'takePicture',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'pt'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
