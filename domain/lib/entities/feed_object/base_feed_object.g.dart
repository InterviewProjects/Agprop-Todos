// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_feed_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseFeedObject<T> _$BaseFeedObjectFromJson<T extends BaseFeedItem>(
        Map<String, dynamic> json) =>
    BaseFeedObject<T>(
      feedType: $enumDecode(_$FeedTypeEnumMap, json['feedType']),
      rawItem: json['item'],
    );

Map<String, dynamic> _$BaseFeedObjectToJson<T extends BaseFeedItem>(
        BaseFeedObject<T> instance) =>
    <String, dynamic>{
      'feedType': _$FeedTypeEnumMap[instance.feedType]!,
      'item': instance.rawItem,
    };

const _$FeedTypeEnumMap = {
  FeedType.FEED_TITLE: 'FEED_TITLE',
};
