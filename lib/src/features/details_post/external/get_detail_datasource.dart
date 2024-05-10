import 'package:pub/src/features/details_post/data/datasourcers/get_detail_datasource.dart';
import 'package:pub/src/features/details_post/data/models/detail_model.dart';
import 'package:pub/src/shared/utils/mock_http.dart';

class GetDetailDatasourceImpl implements GetDetailDatasource {
  @override
  Future<DetailModel> call() async {
    try {
      final response = await MockHttpResponse.getDetailSuccess();
      return DetailModel.fromJson(response);
    } catch (e) {
      throw Exception();
    }
  }
}
