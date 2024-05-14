import 'package:mobx/mobx.dart';
import 'package:pub/src/features/details_pub/domain/entities/detail_pub.dart';
import 'package:pub/src/features/details_pub/domain/usecases/get_detail_pub_usecase.dart';

part 'detail_pub_controller.g.dart';

class DetailPubController = DetailPubControllerBase with _$DetailPubController;

abstract class DetailPubControllerBase with Store {
  final GetDetailPubUsecase _getDetailPubUsecase;
  DetailPubControllerBase(this._getDetailPubUsecase);

  //OBSERVABLES

  @observable
  bool isLoading = false;

  @observable
  bool isError = false;

  @observable
  DetailPubEntity? entity;

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
  void setDetail(DetailPubEntity v) {
    entity = v;
  }

  Future<void> getDetailPub(String id) async {
    setLoading(true);
    var r = await _getDetailPubUsecase();
    r.fold((error) {
      setError(true);
    }, (r) {
      setDetail(r);
    });
    setLoading(false);
  }

  void dispose() {
    entity = null;
    isError = false;
    isLoading = false;
  }
}
