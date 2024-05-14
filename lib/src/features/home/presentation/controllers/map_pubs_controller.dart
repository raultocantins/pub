import 'package:mobx/mobx.dart';
import 'package:pub/src/features/home/domain/entities/map_pub_entity.dart';
import 'package:pub/src/features/home/domain/usecases/get_map_pubs_usecase.dart';

part 'map_pubs_controller.g.dart';

class MapPubsController = MapPubsControllerBase with _$MapPubsController;

abstract class MapPubsControllerBase with Store {
  final GetMapPubsUsecase getMapPubsUsecase;
  MapPubsControllerBase(this.getMapPubsUsecase);

  //OBSERVABLES

  @observable
  double sliderValue = 12.0;

  @observable
  bool isLoading = false;

  @observable
  bool isError = false;

  @observable
  List<MapPubEntity>? pubs;

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
  void setSliderValue(double v) {
    sliderValue = v;
  }

  @action
  void setPubs(List<MapPubEntity> v) {
    pubs = v;
  }

  Future<void> getPubs() async {
    setLoading(true);
    var r = await getMapPubsUsecase();
    r.fold((error) {
      setError(true);
    }, (r) {
      setPubs(r);
    });
    setLoading(false);
  }

  void dispose() {
    isLoading = false;
    isError = false;
    pubs = null;
    sliderValue = 12;
  }
}
