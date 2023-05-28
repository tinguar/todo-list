import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constant/constant.dart';

Widget tooltipIcon(
  String name,
  IconData icon,
  String url,
) {
  return Tooltip(
    textStyle: const TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    message: name.toUpperCase(),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        icon: FaIcon(
          icon,
          size: 25.0,
          color: Colors.white,
        ),
        onPressed: () => launchInBrowser(url),
      ),
    ),
  );
}

Widget tootilIcons() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      tooltipIcon(
        'FACEBOOK',
        FontAwesomeIcons.facebook,
        'https://www.facebook.com/TinguarTechnology',
      ),
      tooltipIcon(
        'INSTAGRAM',
        FontAwesomeIcons.instagram,
        'https://www.instagram.com/tinguar_technology/',
      ),
      tooltipIcon(
        'TIK TOK',
        FontAwesomeIcons.tiktok,
        'https://www.tiktok.com/@tinguar.com',
      ),
      tooltipIcon(
        'SITIO WEB',
        FontAwesomeIcons.globe,
        'https://tinguar.com/',
      ),
    ],
  );
}
