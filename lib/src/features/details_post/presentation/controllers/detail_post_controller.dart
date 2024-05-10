import 'package:mobx/mobx.dart';
import 'package:pub/src/features/details_post/domain/entities/detail_entity.dart';
import 'package:pub/src/features/details_post/domain/usecases/get_detail_usecase.dart';

part 'detail_post_controller.g.dart';

class DetailPostController = DetailPostControllerBase
    with _$DetailPostController;

abstract class DetailPostControllerBase with Store {
  final GetDetailUsecase _getDetailUsecase;
  DetailPostControllerBase(this._getDetailUsecase);

  //OBSERVABLES

  @observable
  bool isLoading = false;

  @observable
  bool isError = false;

  @observable
  DetailEntity? entity;

  //ACTIONS

  @action
  void setLoading(bool v) {
    isLoading = v;
  }

  @action
  void setError(bool v) {
    isError = v;
  }

  @action
  void setDetail(DetailEntity v) {
    entity = v;
  }

  Future<void> getDetail(String id) async {
    setLoading(true);
    var r = await _getDetailUsecase();
    r.fold((error) {
      setError(true);
    }, (r) {
      setDetail(r);
    });
    setLoading(false);
  }

  dispose() {
    entity = null;
    isError = false;
    isLoading = false;
  }
}
