import 'package:pub/src/features/details_pub/data/models/detail_pub_model.dart';

abstract class GetDetailPubDatasource {
  Future<DetailPubModel> call();
}
