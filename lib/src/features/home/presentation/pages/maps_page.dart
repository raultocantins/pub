import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'package:latlong2/latlong.dart';
import 'package:pub/src/features/home/domain/entities/map_pub_entity.dart';
import 'package:pub/src/features/home/presentation/controllers/map_pubs_controller.dart';
import 'package:pub/src/features/home/presentation/utils/enums/environment_type_enum.dart';
import 'package:pub/src/features/home/presentation/utils/enums/time_type_enum.dart';
import 'package:pub/src/shared/widgets/photo_view_screen.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  MapPubsController? _controller;

  @override
  void initState() {
    _controller = GetIt.I.get<MapPubsController>();
    _controller?.getPubs();
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
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
                          child: const TextField(
                            decoration: InputDecoration(
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
                              'Filtrar',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
          ),
        ),
      ),
      body: Observer(builder: (context) {
        return FlutterMap(
          options: MapOptions(
            initialCenter: const LatLng(-10.24399, -48.33543),
            initialZoom: 15.0,
            backgroundColor: Theme.of(context).colorScheme.background,
          ),
          children: [
            SizedBox(
              child: TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
            ),
            if (_controller?.isLoading ?? false)
              const Center(
                child: CircularProgressIndicator(),
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
                      const SizedBox(
                        height: 60,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Chip(
                                label: Text(
                                  'Econômico',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Chip(
                                label: Text(
                                  'Médio',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Chip(
                                label: Text(
                                  'Caro',
                                  style: TextStyle(color: Colors.white),
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
