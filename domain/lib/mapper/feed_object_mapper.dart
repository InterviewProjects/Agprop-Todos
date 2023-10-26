import 'package:domain_package/entities/feed_object/base_feed_object.dart';
import 'package:domain_package/entities/title/title_item.dart';
import 'package:domain_package/enums/feed_type.dart';
import 'package:json_annotation/json_annotation.dart';

BaseFeedItem? mapFeedItemFrom(FeedType feedType, dynamic item) {
  BaseFeedItem? returnValue;
  switch(feedType) {
    case FeedType.FEED_TITLE:
      TitleItem.fromJson(item);
      break;
  }

  return returnValue;
}

class Converter implements JsonConverter<List<BaseFeedObject>, List<dynamic>> {
  const Converter();

  @override
  List<BaseFeedObject> fromJson(List<dynamic> jsonList) {
    List<BaseFeedObject> returnValue = [];

    for (var jsonItem in jsonList) {
      try {
        BaseFeedObject baseFeedObject = BaseFeedObject.fromJson(jsonItem);
        BaseFeedItem? baseFeedItem = mapFeedItemFrom(baseFeedObject.feedType, baseFeedObject.rawItem);
        if (baseFeedItem != null) {
          final object = BaseFeedObject(feedType: baseFeedObject.feedType, item: baseFeedItem);
          returnValue.add(object);
        }
      } catch (e) {
        // debugPrint();
      }
    }
    return returnValue;
  }

  @override
  List<dynamic> toJson(List<BaseFeedObject<BaseFeedItem>> object) {
    List<dynamic> returnValue = [];
    for (var objectItem in object) {
      dynamic feedObjectJsonStr = objectItem.toJson();
      returnValue.add(feedObjectJsonStr);
    }

    return returnValue;
  }
}