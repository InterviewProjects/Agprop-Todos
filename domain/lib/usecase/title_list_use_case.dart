import 'package:domain_package/entities/api/api.dart';
import 'package:domain_package/entities/title/title_item.dart';
import 'package:domain_package/repositories/title_list_repository.dart';

class TitleListUseCase {
  final TitleListRepository _repository;
  TitleListUseCase(this._repository);

  Future<BaseAppResponse<TitleListResponse>> fetchTitleListResponse() => _repository.fetchTitleListResponse();
}