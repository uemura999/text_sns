import 'flavors.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'main.dart' as runner;

Future<void> main() async {
  F.appFlavor = Flavor.dev;
  await dotenv.load(fileName: "dev.env");
  await runner.main();
}
