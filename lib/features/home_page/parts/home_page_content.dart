// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_mock/core/l10n/generated/l10n.dart';
import 'package:api_mock/core/theme/text_styles_data.dart';
import 'package:api_mock/features/home_page/widgets/post_item_card.dart';
import 'package:flutter/material.dart';

import 'package:api_mock/features/home_page/cubit/home_cubit.dart';

class HomePageContent extends StatelessWidget {
  const HomePageContent(
    this.state, {
    Key? key,
  }) : super(key: key);

  final HomeState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppLocalizations.current.yourFeed,
          style: TextStyleData.title,
        ),
        Expanded(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemCount: state.posts.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final postItem = state.posts[index];
              return PostItemCard(
                postItem: postItem,
                isLastItem: state.posts.length == index + 1,
              );
            },
          ),
        ),
      ],
    );
  }
}
