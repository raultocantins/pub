import 'package:get_it/get_it.dart';
import 'package:pub/src/features/details_post/data/repositories/get_detail_repository.dart';
import 'package:pub/src/features/details_post/domain/usecases/get_detail_usecase.dart';
import 'package:pub/src/features/details_post/external/get_detail_datasource.dart';
import 'package:pub/src/features/details_post/presentation/controllers/detail_post_controller.dart';
import 'package:pub/src/features/details_pub/data/repositories/get_detail_pub_repository.dart';
import 'package:pub/src/features/details_pub/domain/usecases/get_detail_pub_usecase.dart';
import 'package:pub/src/features/details_pub/external/get_detail_pub_datasource.dart';
import 'package:pub/src/features/details_pub/presentation/controllers/detail_pub_controller.dart';
import 'package:pub/src/features/home/data/repositories/get_map_pubs_repository.dart';
import 'package:pub/src/features/home/data/repositories/get_posts_repository.dart';
import 'package:pub/src/features/home/domain/usecases/get_map_pubs_usecase.dart';
import 'package:pub/src/features/home/domain/usecases/get_posts_usecase.dart';
import 'package:pub/src/features/home/external/get_map_pubs_datasource.dart';
import 'package:pub/src/features/home/external/get_posts_datasource.dart';
import 'package:pub/src/features/home/presentation/controllers/discovery_controller.dart';
import 'package:pub/src/features/home/presentation/controllers/map_pubs_controller.dart';

class GetItCore {
  final GetIt instance;
  GetItCore(this.instance);

  void init() {
    instance.registerSingleton<GetMapPubsUsecase>(
      GetMapPubsUsecaseImpl(
        GetMapPubsRepositoryImpl(
          GetMapPubsDatasourceImpl(),
        ),
      ),
    );
    instance.registerSingleton<GetDetailPubUsecase>(
      GetDetailPubUsecaseImpl(
        GetDetailPubRepositoryImpl(
          GetDetailPubDatasourceImpl(),
        ),
      ),
    );

    instance.registerSingleton<GetPostsUsecase>(
      GetPostsUsecaseImpl(
        GetPostsRepositoryImpl(
          GetPostsDatasourceImpl(),
        ),
      ),
    );

    instance.registerSingleton<GetDetailUsecase>(
      GetDetailUsecaseImpl(
        GetDetailRepositoryImpl(
          GetDetailDatasourceImpl(),
        ),
      ),
    );
    instance.registerSingleton<DiscoveryController>(
      DiscoveryController(instance()),
    );

    instance.registerSingleton<DetailPostController>(
      DetailPostController(instance()),
    );
    instance.registerSingleton<DetailPubController>(
      DetailPubController(instance()),
    );

    instance.registerSingleton<MapPubsController>(
      MapPubsController(instance()),
    );
  }
}
