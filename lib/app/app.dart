import 'package:api_mock/app/app_cubit.dart';
import 'package:api_mock/app/app_skeleton.dart';
import 'package:api_mock/core/l10n/generated/l10n.dart';
import 'package:api_mock/features/creating_page/cubit/creating_cubit.dart';
import 'package:api_mock/features/home_page/cubit/home_cubit.dart';
import 'package:api_mock/features/settings_page/cubit/settings_cubit.dart';
import 'package:api_mock/repository/api_repository.dart';
import 'package:api_mock/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required this.notificationService,
    required this.postRepository,
  });

  final NotificationService notificationService;
  final ApiRepository postRepository;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(create: (_) => AppCubit()),
        BlocProvider<HomeCubit>(
            create: (_) => HomeCubit(
                  postRepository,
                )),
        BlocProvider<CreatingCubit>(
            create: (_) => CreatingCubit(postRepository)),
        BlocProvider<SettingsCubit>(create: (_) => SettingsCubit()),
      ],
      child: MaterialApp(
        title: 'Reddit api',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.delegate.supportedLocales,
        home: AppSkeleton(notificationService),
      ),
    );
  }
}
