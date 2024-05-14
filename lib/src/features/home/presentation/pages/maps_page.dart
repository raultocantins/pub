import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'package:latlong2/latlong.dart';
import 'package:pub/src/features/home/domain/entities/map_pub_entity.dart';
import 'package:pub/src/features/home/presentation/controllers/map_pubs_controller.dart';

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
        isScrollControlled: false,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Observer(builder: (context) {
              return SizedBox(
                width: double.infinity,
                height: 230,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Gênero musical',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      child: ListView.builder(
                        itemCount: 8,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, i) => const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Chip(
                            label: Text(
                              'Rock',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'Distância',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Slider.adaptive(
                      value: _controller?.sliderValue ?? 0.0,
                      onChanged: (v) => _controller?.setSliderValue(v),
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
