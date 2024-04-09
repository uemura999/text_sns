import 'package:flutter/material.dart';

class MaintenanceScreen extends StatelessWidget {
  const MaintenanceScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.center,
      child: Text(
        "Maintenance is in progress. Please try again later.",
        style: TextStyle(fontSize: 25.0),
      ),
    );
  }
}
