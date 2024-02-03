import 'package:api_mock/core/models/post_item.dart';
import 'package:api_mock/utils/app_utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_data_model.g.dart';

@JsonSerializable()
final class ApiDataModel {
  ApiDataModel({
    required this.author,
    required this.title,
    required this.ups,
    required this.numComments,
    required this.created,
    required this.createdUtc,
  });

  factory ApiDataModel.fromJson(Map<String, dynamic> json) =>
      _$ApiDataModelFromJson(json);

  final String? author;
  final String? title;
  final int? ups;
  final double? created;
  final double? createdUtc;
  @JsonKey(name: 'num_comments')
  final int? numComments;

  PostItem toApiDataModel() => PostItem(
        id: AppUtils.generateRandomId(),
        title: title ?? '',
        author: author ?? '',
        ups: ups ?? 0,
        numberOfComments: numComments ?? 0,
        createdAt: createdUtc != null
            ? DateTime.fromMillisecondsSinceEpoch(createdUtc!.toInt())
            : DateTime.now(),
      );
}
