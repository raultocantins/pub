import 'package:pub/src/features/details_pub/data/datasourcers/get_detail_pub_datasource.dart';
import 'package:pub/src/features/details_pub/data/models/detail_pub_model.dart';
import 'package:pub/src/shared/utils/mock_http.dart';

class GetDetailPubDatasourceImpl implements GetDetailPubDatasource {
  @override
  Future<DetailPubModel> call() async {
    try {
      final response = await MockHttpResponse.getDetailPubSuccess();
      return DetailPubModel.fromJson(response);
    } catch (e) {
      throw Exception();
    }
  }
}
