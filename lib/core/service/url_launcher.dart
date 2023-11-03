import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:people_app/ui/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  Future<void> openEmailApp(String email) async {
    Clipboard.setData(
      ClipboardData(text: email),
    );
  }

  Future<void> openGoogleMaps(
    BuildContext context, {
    required double latitude,
    required double longitude,
  }) async {
    showDialog(
      context: context,
      builder: (_) => ShowMap(
        latitude: latitude,
        longitude: longitude,
      ),
    );
  }

  Future<void> openPhoneApp(
    String phoneNumber,
  ) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);

    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'No se puede abrir la aplicación de teléfono';
    }
  }
}
