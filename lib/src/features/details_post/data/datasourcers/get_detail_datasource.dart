import 'package:pub/src/features/details_post/data/models/detail_model.dart';

abstract class GetDetailDatasource {
  Future<DetailModel> call();
}
