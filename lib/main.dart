import 'dart:async';
import 'package:flutter/material.dart';
import 'package:text_sns/flavors.dart';
import 'app/app.dart';
import 'package:text_sns/gen/firebase_options_dev.dart' as dev;
import 'package:text_sns/gen/firebase_options_prod.dart' as prod;
import 'package:firebase_core/firebase_core.dart';

FutureOr<void> main() async {
  final flavor = F.appFlavor!;
  final options = flavor == Flavor.dev
      ? dev.DefaultFirebaseOptions.currentPlatform
      : prod.DefaultFirebaseOptions.currentPlatform;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: options);

  runApp(const App());
}
