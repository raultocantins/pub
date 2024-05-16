import 'package:pub/src/features/home/data/datasourcers/get_posts_datasource.dart';
import 'package:pub/src/features/home/data/models/list_post_model.dart';
import 'package:pub/src/features/home/presentation/utils/enums/post_type_enum.dart';
import 'package:pub/src/shared/utils/mock_http.dart';

class GetPostsDatasourceImpl implements GetPostsDatasource {
  @override
  Future<ListPostModel> call(
      {required int page, required PostType type}) async {
    try {
      final response = await MockHttpResponse.getPostsSuccess();
      (response['list'] as List).shuffle(); //embaralhando a lista
      return ListPostModel.fromJson(response);
    } catch (e) {
      throw Exception();
    }
  }
}
