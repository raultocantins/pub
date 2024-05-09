import 'package:get_it/get_it.dart';
import 'package:pub/src/features/home/data/repositories/get_posts_repository.dart';
import 'package:pub/src/features/home/domain/usecases/get_posts_usecase.dart';
import 'package:pub/src/features/home/external/get_posts_datasource.dart';
import 'package:pub/src/features/home/presentation/controllers/discovery_controller.dart';

class GetItCore {
  final GetIt instance;
  GetItCore(this.instance);

  void init() {
    instance.registerSingleton<GetPostsUsecase>(
      GetPostsUsecaseImpl(
        GetPostsRepositoryImpl(
          GetPostsDatasourceImpl(),
        ),
      ),
    );
    instance.registerSingleton<DiscoveryController>(
      DiscoveryController(instance()),
    );
  }
}
