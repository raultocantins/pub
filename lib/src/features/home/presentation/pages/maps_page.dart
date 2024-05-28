import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'package:latlong2/latlong.dart';
import 'package:pub/src/core/geolocator/location_controller.dart';
import 'package:pub/src/features/home/domain/entities/map_pub_entity.dart';
import 'package:pub/src/features/home/presentation/controllers/map_pubs_controller.dart';
import 'package:pub/src/features/home/presentation/utils/enums/environment_type_enum.dart';
import 'package:pub/src/features/home/presentation/utils/enums/price_type_enum.dart';
import 'package:pub/src/features/home/presentation/utils/enums/time_type_enum.dart';
import 'package:pub/src/shared/widgets/card_medium_error.dart';
import 'package:pub/src/shared/widgets/photo_view_screen.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  MapPubsController? _controller;
  TextEditingController? _textEditingController;
  LocationController? _locationController;
  Timer? _debounce;
  String _previousText = '';

  @override
  void initState() {
    _controller = GetIt.I.get<MapPubsController>();
    _textEditingController = TextEditingController();
    _locationController = GetIt.I.get<LocationController>();
    _controller?.getPubs();
    super.initState();
    _textEditingController?.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    if (_textEditingController?.text == _previousText) return;
    _previousText = _textEditingController?.text ?? '';
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if ((_textEditingController?.text.length ?? 0) >= 3) {
        _controller?.getPubs(searchText: _textEditingController?.text);
      }
      if (_textEditingController?.text.isEmpty ?? false) {
        _controller?.getPubs();
      }
    });
  }

  @override
  void dispose() {
    _textEditingController?.removeListener(_onSearchChanged);
    _controller?.dispose();
    _debounce?.cancel();
    _textEditingController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text(
          'Mapa de estabelecimentos',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        centerTitle: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: _textEditingController,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.all(10),
                            label: Text(
                              'Estabelecimento, evento',
                              style: TextStyle(fontSize: 12),
                            ),
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    TextButton(
                      onPressed: () {
                        showModalFilters();
                      },
                      child: const Row(
                        children: [
                          Icon(
                            Icons.filter_alt_sharp,
                            size: 30,
                          ),
                          Text(
                            'Filtros',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: Observer(builder: (context) {
        return FlutterMap(
          options: MapOptions(
            initialCenter: const LatLng(-10.24399, -48.32473),
            initialZoom: 14.0,
            backgroundColor: Theme.of(context).colorScheme.background,
          ),
          children: [
            GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SizedBox(
                child: TileLayer(
                  urlTemplate:
                      'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
                  additionalOptions: const {
                    'accessToken':
                        'pk.eyJ1IjoiYWxleHJhdWwiLCJhIjoiY2x3YXgwa2diMGlyejJtcWszNjNuYTlxbiJ9.msz1jd1edJKxR7xKWEiFsw', //retirar access token daqui
                    'id': 'alexraul/clwcf6f2w01ru01qg5cf9g7i6',
                  },
                ),
              ),
            ),
            MarkerLayer(
              markers: _controller?.pubs
                      ?.map(
                        (e) => Marker(
                          point:
                              LatLng(e.location.latitude, e.location.longitude),
                          width: 50,
                          height: 50,
                          child: GestureDetector(
                            onTap: () => showModalPubDetails(e),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                e.imageUrl,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList() ??
                  [],
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: LatLng(
                    _locationController?.location?.latitude ?? -10.24399,
                    _locationController?.location?.longitude ?? -48.32473,
                  ),
                  child: Icon(
                    Icons.location_history,
                    color: Theme.of(context).colorScheme.primary,
                    size: 52,
                  ),
                )
              ],
            ),
            if (_controller?.isLoading ?? false)
              const Center(
                child: CircularProgressIndicator(),
              )
            else if (_controller?.isError ?? false)
              Center(
                child: SizedBox(
                  width: 300,
                  height: 200,
                  child: Card(
                    elevation: 1,
                    color: Theme.of(context).colorScheme.background,
                    child: CardMediumError(
                      onPressed: () => _controller?.getPubs(),
                    ),
                  ),
                ),
              ),
            Observer(builder: (context) {
              return Column(
                children: [
                  if (_locationController?.location == null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: TextButton(
                        onPressed: () => _locationController?.getPosition(),
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.black),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              'Ativar localização',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              );
            }),
          ],
        );
      }),
    );
  }

  void showModalFilters() {
    showModalBottomSheet(
        context: context,
        backgroundColor: Theme.of(context).colorScheme.background,
        isScrollControlled: true,
        builder: (context) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Observer(builder: (context) {
                return SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      const Text(
                        'Ambiente',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 60,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (_controller?.environmentType !=
                                      EnvironmentType.externalArea) {
                                    _controller?.setEnvironmentType(
                                        EnvironmentType.externalArea);
                                  } else {
                                    _controller?.setEnvironmentType(null);
                                  }
                                },
                                child: Chip(
                                  backgroundColor: _controller
                                              ?.environmentType ==
                                          EnvironmentType.externalArea
                                      ? Theme.of(context).colorScheme.primary
                                      : null,
                                  label: const Text(
                                    'Área externa',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (_controller?.environmentType !=
                                      EnvironmentType.internalArea) {
                                    _controller?.setEnvironmentType(
                                        EnvironmentType.internalArea);
                                  } else {
                                    _controller?.setEnvironmentType(null);
                                  }
                                },
                                child: Chip(
                                  backgroundColor: _controller
                                              ?.environmentType ==
                                          EnvironmentType.internalArea
                                      ? Theme.of(context).colorScheme.primary
                                      : null,
                                  label: const Text(
                                    'Ambiente interno',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (_controller?.environmentType !=
                                      EnvironmentType.rooftop) {
                                    _controller?.setEnvironmentType(
                                        EnvironmentType.rooftop);
                                  } else {
                                    _controller?.setEnvironmentType(null);
                                  }
                                },
                                child: Chip(
                                  backgroundColor: _controller
                                              ?.environmentType ==
                                          EnvironmentType.rooftop
                                      ? Theme.of(context).colorScheme.primary
                                      : null,
                                  label: const Text(
                                    'Rooftop',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const Text(
                        'Horário de Funcionamento',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 60,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (_controller?.timeType !=
                                      TimeType.nowOpen) {
                                    _controller?.setTimeType(TimeType.nowOpen);
                                  } else {
                                    _controller?.setTimeType(null);
                                  }
                                },
                                child: Chip(
                                  backgroundColor: _controller?.timeType ==
                                          TimeType.nowOpen
                                      ? Theme.of(context).colorScheme.primary
                                      : null,
                                  label: const Text(
                                    'Aberto agora',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (_controller?.timeType !=
                                      TimeType.open24) {
                                    _controller?.setTimeType(TimeType.open24);
                                  } else {
                                    _controller?.setTimeType(null);
                                  }
                                },
                                child: Chip(
                                  backgroundColor: _controller?.timeType ==
                                          TimeType.open24
                                      ? Theme.of(context).colorScheme.primary
                                      : null,
                                  label: const Text(
                                    'Aberto 24 Horas',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (_controller?.timeType !=
                                      TimeType.closedNow) {
                                    _controller
                                        ?.setTimeType(TimeType.closedNow);
                                  } else {
                                    _controller?.setTimeType(null);
                                  }
                                },
                                child: Chip(
                                  backgroundColor: _controller?.timeType ==
                                          TimeType.closedNow
                                      ? Theme.of(context).colorScheme.primary
                                      : null,
                                  label: const Text(
                                    'Fechados agora',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const Text(
                        'Preço',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 60,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (_controller?.priceType !=
                                      PriceType.economic) {
                                    _controller
                                        ?.setPriceType(PriceType.economic);
                                  } else {
                                    _controller?.setPriceType(null);
                                  }
                                },
                                child: Chip(
                                  backgroundColor: _controller?.priceType ==
                                          PriceType.economic
                                      ? Theme.of(context).colorScheme.primary
                                      : null,
                                  label: const Text(
                                    'Econômico',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (_controller?.priceType !=
                                      PriceType.medium) {
                                    _controller?.setPriceType(PriceType.medium);
                                  } else {
                                    _controller?.setPriceType(null);
                                  }
                                },
                                child: Chip(
                                  backgroundColor: _controller?.priceType ==
                                          PriceType.medium
                                      ? Theme.of(context).colorScheme.primary
                                      : null,
                                  label: const Text(
                                    'Médio',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (_controller?.priceType !=
                                      PriceType.expensive) {
                                    _controller
                                        ?.setPriceType(PriceType.expensive);
                                  } else {
                                    _controller?.setPriceType(null);
                                  }
                                },
                                child: Chip(
                                  backgroundColor: _controller?.priceType ==
                                          PriceType.expensive
                                      ? Theme.of(context).colorScheme.primary
                                      : null,
                                  label: const Text(
                                    'Caro',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Distância',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${_controller?.sliderValue} km',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Slider.adaptive(
                        value: _controller?.sliderValue.toDouble() ?? 0.0,
                        onChanged: (v) =>
                            _controller?.setSliderValue(v.toInt()),
                        label: '${_controller?.sliderValue}',
                        max: 30,
                        min: 5,
                      ),
                      const Expanded(
                        child: SizedBox(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.black),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'Voltar',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  Theme.of(context).colorScheme.primary),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                              _controller?.getPubs();
                            },
                            child: const Text(
                              'Pesquisar',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
            ),
          );
        });
  }

  void showModalPubDetails(MapPubEntity pub) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Theme.of(context).colorScheme.background,
        isScrollControlled: false,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Observer(builder: (context) {
              return SizedBox(
                width: double.infinity,
                height: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Informações do estabelecimento:',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        pub.pubName,
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        pub.address,
                        style: const TextStyle(color: Colors.white),
                      ),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(pub.imageUrl),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 100,
                        child: ListView.builder(
                          itemCount: pub.images.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, i) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 24),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PhotoViewScreen(
                                        images: pub.images,
                                        initialIndex: i,
                                      ),
                                    ),
                                  );
                                },
                                child: SizedBox(
                                  width: 150,
                                  child: Card(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                            pub.images[i],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.black),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'Voltar',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Theme.of(context).colorScheme.primary),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              '/details-pub',
                              arguments: {
                                'pubId': pub.id,
                                'pubImageUrl': pub.imageUrl,
                                'pubName': pub.pubName,
                              },
                            );
                          },
                          child: const Text(
                            'Ver mais',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }),
          );
        });
  }
}
