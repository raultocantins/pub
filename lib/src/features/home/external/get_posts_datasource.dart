import 'package:pub/src/features/home/data/datasourcers/get_posts_datasource.dart';
import 'package:pub/src/features/home/data/models/list_post_model.dart';

class GetPostsDatasourceImpl implements GetPostsDatasource {
  @override
  Future<ListPostModel> call() async {
    try {
      return ListPostModel(list: [], hasMore: false, page: 1);
    } catch (e) {
      throw Exception();
    }
  }
}
