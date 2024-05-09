import 'package:pub/src/features/home/data/models/list_post_model.dart';

abstract class GetPostsDatasource {
  Future<ListPostModel> call();
}
