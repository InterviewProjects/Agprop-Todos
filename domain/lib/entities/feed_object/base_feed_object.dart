// ignore_for_file: invalid_annotation_target

import 'package:domain_package/enums/feed_type.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'base_feed_object.g.dart';

@JsonSerializable()
class BaseFeedObject<T extends BaseFeedItem> extends Equatable {
  final FeedType feedType;
  @JsonKey(name: 'item') final dynamic rawItem;
  @JsonKey(includeFromJson: false, includeToJson: false) final BaseFeedItem? item;
  const BaseFeedObject({
    required this.feedType,
    @JsonKey(name: 'item') this.rawItem,
    @JsonKey(includeFromJson: false, includeToJson: false) this.item,
  });

  factory BaseFeedObject.fromJson(Map<String, dynamic> json) => _$BaseFeedObjectFromJson(json);

  Map<String, dynamic> toJson() => _$BaseFeedObjectToJson(this);

  @override
  List<Object?> get props => [
    feedType,
    rawItem,
  ];
}

abstract class BaseFeedItem extends Equatable {
  const BaseFeedItem();

  bool isValidItem();

  @override
  List<Object?> get props => [];
}