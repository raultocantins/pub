import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:latlong2/latlong.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text(
          'Mapa',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        centerTitle: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(130),
          child: SizedBox(
              height: 130,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
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
                              'Pesquise pelo estabelecimento',
                            ),
                            labelStyle: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Row(
                      children: [
                        Chip(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          label: const Row(
                            children: [
                              Icon(Icons.location_on, color: Colors.white),
                              Text(
                                'Distância',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Chip(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          label: const Row(
                            children: [
                              Icon(Icons.music_note, color: Colors.white),
                              Text(
                                'Gênero musical',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )),
        ),
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: const LatLng(-10.24399, -48.32473),
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
          const MarkerLayer(
            markers: [
              Marker(
                point: LatLng(-10.24399, -48.32473),
                width: 50,
                height: 50,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://www.mytapp.com.br/wp-content/uploads/2022/10/atrair_mais_clientes_bar.webp'),
                ),
              ),
              Marker(
                point: LatLng(-10.24399, -48.32933),
                width: 50,
                height: 50,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://www.mytapp.com.br/wp-content/uploads/2022/10/atrair_mais_clientes_bar.webp'),
                ),
              ),
              Marker(
                point: LatLng(-10.24399, -48.31073),
                width: 50,
                height: 50,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://www.mytapp.com.br/wp-content/uploads/2022/10/atrair_mais_clientes_bar.webp'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
