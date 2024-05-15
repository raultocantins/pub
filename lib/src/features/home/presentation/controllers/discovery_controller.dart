import 'package:mobx/mobx.dart';
import 'package:pub/src/features/home/domain/entities/list_post_entity.dart';
import 'package:pub/src/features/home/domain/usecases/get_posts_usecase.dart';

part 'discovery_controller.g.dart';

class DiscoveryController = DiscoveryControllerBase with _$DiscoveryController;

abstract class DiscoveryControllerBase with Store {
  final GetPostsUsecase _getPostsUsecase;
  DiscoveryControllerBase(this._getPostsUsecase);

  //OBSERVABLES

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
  void setHighlightedPosts(ListPostEntity v) {
    highlightedPosts = v;
  }

  @action
  void setNearestPosts(ListPostEntity v) {
    nearestPosts = v;
  }

  @action
  void setPromotionsPosts(ListPostEntity v) {
    promotionsPosts = v;
  }

  @action
  void setTodayPosts(ListPostEntity v) {
    todayPosts = v;
  }

  Future<void> getHighLightedPosts() async {
    setHighlightedLoading(true);
    var r = await _getPostsUsecase();
    r.fold((error) {
      setHighlightedError(true);
    }, (r) {
      setHighlightedPosts(r);
    });
    setHighlightedLoading(false);
  }

  Future<void> getNearestPosts() async {
    setNearestLoading(true);
    var r = await _getPostsUsecase();
    r.fold((error) {
      setNearestError(true);
    }, (r) {
      setNearestPosts(r);
    });
    setNearestLoading(false);
  }

  Future<void> getPromotionsPosts() async {
    setPromotionsLoading(true);
    var r = await _getPostsUsecase();
    r.fold((error) {
      setPromotionsError(true);
    }, (r) {
      setPromotionsPosts(r);
    });
    setPromotionsLoading(false);
  }

  Future<void> getTodayPosts() async {
    setTodayLoading(true);
    var r = await _getPostsUsecase();
    r.fold((error) {
      setTodayError(true);
    }, (r) {
      setTodayPosts(r);
    });
    setTodayLoading(false);
  }

  void initLoadingPosts() {
    getHighLightedPosts();
    getNearestPosts();
    getPromotionsPosts();
    getTodayPosts();
  }

  void dispose() {
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
