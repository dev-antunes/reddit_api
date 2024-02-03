// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_mock/core/l10n/generated/l10n.dart';
import 'package:api_mock/core/models/post_item.dart';
import 'package:api_mock/core/theme/app_colors.dart';
import 'package:api_mock/features/creating_page/cubit/creating_cubit.dart';
import 'package:flutter/material.dart';

import 'package:api_mock/core/theme/text_styles_data.dart';
import 'package:api_mock/features/creating_page/widgets/creation_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatingContent extends StatefulWidget {
  const CreatingContent(
    this.postItem, {
    Key? key,
  }) : super(key: key);
  final PostItem? postItem;

  @override
  State<CreatingContent> createState() => _CreatingPageState();
}

class _CreatingPageState extends State<CreatingContent> {
  late final CreatingCubit creatingCubit;
  @override
  void initState() {
    creatingCubit = context.read<CreatingCubit>();
    creatingCubit.onEditionInitiation(widget.postItem);
    super.initState();
  }

  bool get isEditing => widget.postItem != null;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          isEditing
              ? AppLocalizations.current.editing
              : AppLocalizations.current.addToList,
          style: TextStyleData.title,
        ),
        const SizedBox(height: 20),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CreationForm(
                    label: AppLocalizations.current.author,
                    initialValue: widget.postItem?.author,
                    onChanged: (value) {
                      creatingCubit.onChangeItemAuthor(value);
                    }),
                const SizedBox(height: 20),
                CreationForm(
                  label: AppLocalizations.current.title,
                  initialValue: widget.postItem?.title,
                  onChanged: (value) => creatingCubit.onChangeItemTitle(value),
                ),
                const SizedBox(height: 20),
                CreationForm(
                  label: AppLocalizations.current.comment,
                  initialValue: widget.postItem?.numberOfComments.toString(),
                  keyboardType: TextInputType.number,
                  onChanged: (value) =>
                      creatingCubit.onChangeItemCommentNumber(value),
                ),
                const SizedBox(height: 20),
                CreationForm(
                  label: AppLocalizations.current.ups,
                  initialValue: widget.postItem?.ups.toString(),
                  keyboardType: TextInputType.number,
                  onChanged: (value) =>
                      creatingCubit.onChangeItemUpNumber(value),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          creatingCubit.validToProceed
                              ? AppColors.primary
                              : AppColors.inactiveColor),
                    ),
                    onPressed: creatingCubit.validToProceed
                        ? isEditing
                            ? () => creatingCubit.updatePost()
                            : () => creatingCubit.addPost()
                        : null,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        isEditing ? Icons.edit : Icons.add,
                        size: isEditing ? 20 : 40,
                        color: creatingCubit.validToProceed
                            ? AppColors.primaryLight
                            : AppColors.primaryLight.withOpacity(0.5),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
