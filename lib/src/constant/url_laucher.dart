import 'package:url_launcher/url_launcher.dart';


Future<void> launchInBrowser( uri) async {
  final url = Uri.parse(uri);
  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    throw Exception('Could not launch $url');
  }
}