import 'dart:io';

import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherCustom {
  static void launchMaps(LatLng? location) async {
    if (Platform.isIOS) {
      // URL específica para iOS
      String url =
          'https://maps.apple.com/?q=${location?.latitude},${location?.longitude}';
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        throw 'Não foi possível abrir o mapa';
      }
    } else if (Platform.isAndroid) {
      // URL específica para Android
      String url =
          'https://www.google.com/maps/search/?api=1&query=${location?.latitude},${location?.longitude}';
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        throw 'Não foi possível abrir o mapa';
      }
    }
  }
}
