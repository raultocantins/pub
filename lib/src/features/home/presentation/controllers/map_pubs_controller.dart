import 'package:mobx/mobx.dart';
import 'package:pub/src/features/home/domain/entities/map_pub_entity.dart';
import 'package:pub/src/features/home/domain/usecases/get_map_pubs_usecase.dart';
import 'package:pub/src/features/home/presentation/utils/enums/environment_type_enum.dart';
import 'package:pub/src/features/home/presentation/utils/enums/price_type_enum.dart';
import 'package:pub/src/features/home/presentation/utils/enums/time_type_enum.dart';

part 'map_pubs_controller.g.dart';

class MapPubsController = MapPubsControllerBase with _$MapPubsController;

abstract class MapPubsControllerBase with Store {
  final GetMapPubsUsecase getMapPubsUsecase;
  MapPubsControllerBase(this.getMapPubsUsecase);

  //OBSERVABLES

  @observable
  int sliderValue = 12;

  @observable
  bool isLoading = false;

  @observable
  bool isError = false;

  @observable
  List<MapPubEntity>? pubs;

  @observable
  EnvironmentType? environmentType;

  @observable
  TimeType? timeType;

  @observable
  PriceType? priceType;

  @observable
  String? searchText;

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
  void setSliderValue(int v) {
    sliderValue = v;
  }

  @action
  void setPubs(List<MapPubEntity> v) {
    pubs = v;
  }

  @action
  void setEnvironmentType(EnvironmentType? v) {
    environmentType = v;
  }

  @action
  void setTimeType(TimeType? v) {
    timeType = v;
  }

  @action
  void setPriceType(PriceType? v) {
    priceType = v;
  }

  @action
  void setSearchText(String? v) {
    searchText = v;
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
    priceType = null;
    environmentType = null;
    timeType = null;
    searchText = null;
  }
}
