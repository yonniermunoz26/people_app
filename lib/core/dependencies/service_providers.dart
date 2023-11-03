import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../service/url_launcher.dart';

final launchUrlProvider = Provider(
  (ref) => UrlLauncherService(),
);
