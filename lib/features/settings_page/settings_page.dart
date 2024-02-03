import 'dart:io';

import 'package:api_mock/core/l10n/generated/l10n.dart';
import 'package:api_mock/features/settings_page/cubit/settings_cubit.dart';
import 'package:api_mock/features/settings_page/parts/camera_section.dart';
import 'package:api_mock/features/settings_page/parts/language_section.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pageHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: pageHeight * 0.03),
        const LanguageSection(),
        SizedBox(height: pageHeight * 0.03),
        SizedBox(
          height: pageHeight * 0.35,
          width: 150,
          child: Card(
            child: BlocBuilder<SettingsCubit, SettingsState>(
                builder: (context, state) {
              return state.file == null
                  ? Icon(
                      Icons.person,
                      size: 120,
                      color: Colors.white.withOpacity(0.3),
                    )
                  : FittedBox(
                      fit: BoxFit.contain,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          File(state.file!.path),
                        ),
                      ),
                    );
            }),
          ),
        ),
        GestureDetector(
          onTap: () async {
            final cameras = await availableCameras();
            if (!context.mounted) return;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CameraSection(
                  camera: cameras.first,
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Chip(
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  BlocBuilder<SettingsCubit, SettingsState>(
                    buildWhen: (previous, current) =>
                        current is SettingsUpdatedState,
                    builder: (context, state) {
                      return Text(AppLocalizations.current.takePicture);
                    },
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.camera_alt_outlined)
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
