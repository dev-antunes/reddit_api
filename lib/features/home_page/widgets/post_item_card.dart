import 'package:api_mock/core/extensions/string_extensions.dart';
import 'package:api_mock/core/models/post_item.dart';
import 'package:api_mock/core/theme/text_styles_data.dart';
import 'package:api_mock/features/creating_page/creating_page.dart';
import 'package:api_mock/features/home_page/cubit/home_cubit.dart';
import 'package:api_mock/features/home_page/widgets/list_item_tile_info.dart';
import 'package:api_mock/features/home_page/widgets/thin_vertical_divider.dart';
import 'package:api_mock/utils/app_utils.dart';
import 'package:api_mock/widgets/page_animator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class PostItemCard extends StatelessWidget {
  const PostItemCard({
    Key? key,
    required this.postItem,
    required this.isLastItem,
  }) : super(key: key);

  final PostItem postItem;
  final bool isLastItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          )),
          elevation: 4.0,
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Stack(
            children: [
              ListTile(
                title: Text(
                  postItem.author.capitalize(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Text(postItem.title),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListItemTileInfo(
                          postInfo:
                              AppUtils.formatNumber(postItem.commentsQuantity),
                          icon: Icons.comment,
                          color: Colors.blue,
                        ),
                        const ThinVerticalDivider(horizontalPadding: 12),
                        Expanded(
                          child: ListItemTileInfo(
                            postInfo: AppUtils.formatNumber(postItem.ups),
                            icon: Icons.arrow_upward,
                            color: Colors.green,
                          ),
                        ),
                        ListItemTileInfo(
                          postInfo: DateFormat('dd/MM/yyyy')
                              .format(postItem.createdAt),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (postItem.fromHive)
                Positioned(
                    top: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () => callSimpleDisplayDialog(context, postItem),
                      child: const DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Icon(
                            Icons.menu_rounded,
                            size: 22,
                          ),
                        ),
                      ),
                    ))
            ],
          ),
        ),
        if (isLastItem) const SizedBox(height: 70)
      ],
    );
  }
}

Future<dynamic> callSimpleDisplayDialog(BuildContext context, PostItem item) {
  return showDialog(
    context: context,
    builder: ((context) => AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: Colors.white38, width: 1)),
          content: Text(
            'Options',
            style: TextStyleData.title,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(
                      PageAnimator(
                        child: CreatingPage(
                          item: item,
                          isEdidtion: true,
                        ),
                      ),
                    );
                  },
                  child: Text('Edit'),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      context.read<HomeCubit>().delete(item.id);
                    },
                    child: Text('Delete')),
              ],
            )
          ],
        )),
  );
}
