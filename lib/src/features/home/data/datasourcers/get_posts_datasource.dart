import 'package:pub/src/features/home/data/models/list_post_model.dart';
import 'package:pub/src/features/home/presentation/utils/enums/post_type_enum.dart';

abstract class GetPostsDatasource {
  Future<ListPostModel> call({required int page, required PostType type});
}
