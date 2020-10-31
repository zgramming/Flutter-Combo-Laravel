import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:global_template/global_template.dart';

import 'src/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  colorPallete.configuration();
  appConfig.configuration(
    baseAPIURL: 'http://zimprov.id/api.laravel/simplecrud/api',
    baseImageURL: 'http://zimprov.id/api.laravel/simplecrud/storage/images',
  );

  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}
