import 'package:mobx/mobx.dart';
import 'package:pub/src/features/home/domain/entities/list_post_entity.dart';
import 'package:pub/src/features/home/domain/entities/post_entity.dart';
import 'package:pub/src/features/home/domain/usecases/get_posts_usecase.dart';
import 'package:pub/src/features/home/presentation/utils/enums/post_type_enum.dart';

part 'discovery_controller.g.dart';

class DiscoveryController = DiscoveryControllerBase with _$DiscoveryController;

abstract class DiscoveryControllerBase with Store {
  final GetPostsUsecase _getPostsUsecase;
  DiscoveryControllerBase(this._getPostsUsecase);

  //OBSERVABLES

  @observable
  int highlightedPagination = 1;

  @observable
  int nearestPagination = 1;

  @observable
  int promotionsPagination = 1;

  @observable
  int todayPagination = 1;

  @observable
  bool highlightedLoading = false;

  @observable
  bool nearestLoading = false;

  @observable
  bool promotionsLoading = false;

  @observable
  bool todayLoading = false;

  @observable
  bool highlightedError = false;

  @observable
  bool nearestError = false;

  @observable
  bool promotionsError = false;

  @observable
  bool todayError = false;

  @observable
  ListPostEntity? highlightedPosts;

  @observable
  ListPostEntity? nearestPosts;

  @observable
  ListPostEntity? promotionsPosts;

  @observable
  ListPostEntity? todayPosts;

  //ACTIONS

  @action
  void setHighlightedLoading(bool v) {
    highlightedLoading = v;
  }

  @action
  void setNearestLoading(bool v) {
    nearestLoading = v;
  }

  @action
  void setPromotionsLoading(bool v) {
    promotionsLoading = v;
  }

  @action
  void setTodayLoading(bool v) {
    todayLoading = v;
  }

  @action
  void setHighlightedError(bool v) {
    highlightedError = v;
  }

  @action
  void setNearestError(bool v) {
    nearestError = v;
  }

  @action
  void setPromotionsError(bool v) {
    promotionsError = v;
  }

  @action
  void setTodayError(bool v) {
    todayError = v;
  }

  @action
  void setHighlightedPosts(ListPostEntity? v) {
    highlightedPosts = v;
  }

  @action
  void setNearestPosts(ListPostEntity? v) {
    nearestPosts = v;
  }

  @action
  void setPromotionsPosts(ListPostEntity? v) {
    promotionsPosts = v;
  }

  @action
  void setTodayPosts(ListPostEntity? v) {
    todayPosts = v;
  }

  Future<void> getHighLightedPosts() async {
    if (highlightedPosts != null) {
      if (!(highlightedPosts?.hasMore ?? false)) {
        return;
      }
    }
    setHighlightedLoading(true);
    var r = await _getPostsUsecase(
        page: highlightedPagination, type: PostType.highlighted);
    r.fold((error) {
      setHighlightedError(true);
    }, (r) {
      if (highlightedPosts == null) {
        setHighlightedPosts(r);
      } else {
        List<PostEntity>? newlist = highlightedPosts?.list;
        newlist?.addAll(r.list ?? []);
        setHighlightedPosts(
          ListPostEntity(list: newlist, hasMore: r.hasMore, page: r.page),
        );
      }

      if (r.hasMore ?? false) {
        highlightedPagination += 1;
      }
    });
    setHighlightedLoading(false);
  }

  Future<void> getNearestPosts() async {
    if (nearestPosts != null) {
      if (!(nearestPosts?.hasMore ?? false)) {
        return;
      }
    }

    setNearestLoading(true);
    var r =
        await _getPostsUsecase(page: nearestPagination, type: PostType.nearest);
    r.fold((error) {
      setNearestError(true);
    }, (r) {
      if (nearestPosts == null) {
        setNearestPosts(r);
      } else {
        List<PostEntity>? newlist = nearestPosts?.list;
        newlist?.addAll(r.list ?? []);
        setNearestPosts(
          ListPostEntity(list: newlist, hasMore: r.hasMore, page: r.page),
        );
      }

      if (r.hasMore ?? false) {
        nearestPagination += 1;
      }
    });
    setNearestLoading(false);
  }

  Future<void> getPromotionsPosts() async {
    if (promotionsPosts != null) {
      if (!(promotionsPosts?.hasMore ?? false)) {
        return;
      }
    }

    setPromotionsLoading(true);
    var r = await _getPostsUsecase(
        page: promotionsPagination, type: PostType.promotions);
    r.fold((error) {
      setPromotionsError(true);
    }, (r) {
      if (promotionsPosts == null) {
        setPromotionsPosts(r);
      } else {
        List<PostEntity>? newlist = promotionsPosts?.list;
        newlist?.addAll(r.list ?? []);
        setPromotionsPosts(
          ListPostEntity(list: newlist, hasMore: r.hasMore, page: r.page),
        );
      }

      if (r.hasMore ?? false) {
        promotionsPagination += 1;
      }
    });
    setPromotionsLoading(false);
  }

  Future<void> getTodayPosts() async {
    if (todayPosts != null) {
      if (!(todayPosts?.hasMore ?? false)) {
        return;
      }
    }

    setTodayLoading(true);
    var r = await _getPostsUsecase(page: todayPagination, type: PostType.today);
    r.fold((error) {
      setTodayError(true);
    }, (r) {
      if (todayPosts == null) {
        setTodayPosts(r);
      } else {
        List<PostEntity>? newlist = todayPosts?.list;
        newlist?.addAll(r.list ?? []);
        setTodayPosts(
          ListPostEntity(list: newlist, hasMore: r.hasMore, page: r.page),
        );
      }

      if (r.hasMore ?? false) {
        todayPagination += 1;
      }
    });
    setTodayLoading(false);
  }

  void initLoadingPosts() {
    getHighLightedPosts();
    getNearestPosts();
    getPromotionsPosts();
    getTodayPosts();
  }

  void onRefresh() {
    setHighlightedPosts(null);
    setNearestPosts(null);
    setPromotionsPosts(null);
    setTodayPosts(null);

    getHighLightedPosts();
    getNearestPosts();
    getPromotionsPosts();
    getTodayPosts();
  }

  void dispose() {
    highlightedPagination = 1;
    nearestPagination = 1;
    promotionsPagination = 1;
    todayPagination = 1;
    highlightedLoading = false;
    nearestLoading = false;
    promotionsLoading = false;
    todayLoading = false;
    highlightedError = false;
    nearestError = false;
    promotionsError = false;
    todayError = false;
  }
}
