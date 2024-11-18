import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  static Future<void> launchArticleUrl({required String articleUrl}) async {
    final Uri url = Uri.parse(articleUrl);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
