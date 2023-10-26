import 'package:data_package/remote/api_controller.dart';
import 'package:data_package/src/mock_data.dart';
import 'package:domain_package/entities/api/api.dart';
import 'package:domain_package/entities/title/title_item.dart';
import 'package:domain_package/repositories/title_list_repository.dart';

class TitleListRepositoryImpl implements TitleListRepository {
  final ApiController _baseAPI;
  TitleListRepositoryImpl(this._baseAPI);

  @override
  Future<BaseAppResponse<TitleListResponse>> fetchTitleListResponse() {
    final response = TitleListResponse.fromJson(mockData);
    return Future.value(BaseAppResponse(data: response));
  }

}