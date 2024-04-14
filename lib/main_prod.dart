import 'flavors.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'main.dart' as runner;

Future<void> main() async {
  F.appFlavor = Flavor.prod;
  await dotenv.load(fileName: "prod.env");
  await runner.main();
}
