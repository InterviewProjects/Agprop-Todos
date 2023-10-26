import 'package:domain_package/entities/feed_object/base_feed_object.dart';
import 'package:domain_package/entities/api/api.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'title_item.g.dart';

@JsonSerializable()
@CopyWith()
class TitleListResponse extends BaseApiResponse {
  const TitleListResponse({
    List<BaseFeedObject>? baseFeedItemList,
  });

  factory TitleListResponse.fromJson(Map<String, Object?> json) => _$TitleListResponseFromJson(json);

  @override Map<String, dynamic> toJson() => _$TitleListResponseToJson(this);
}

@JsonSerializable()
@CopyWith()
class TitleItem extends BaseFeedItem {
  final String? title;
  const TitleItem({
    this.title,
  });

  factory TitleItem.fromJson(Map<String, Object?> json) => _$TitleItemFromJson(json);

  Map<String, dynamic> toJson() => _$TitleItemToJson(this);

  @override
  bool isValidItem() => title?.isNotEmpty == true;
}