import 'package:domain_package/entities/api/api.dart';
import 'package:domain_package/entities/title/title_item.dart';

abstract class TitleListRepository {
  Future<BaseAppResponse<TitleListResponse>> fetchTitleListResponse();
}