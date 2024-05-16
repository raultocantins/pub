import 'package:url_launcher/url_launcher.dart';

class UrlLauncherCustom {
  static void launchUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      launchUrl(url);
    } else {
      throw 'Não foi possível abrir a url';
    }
  }
}
