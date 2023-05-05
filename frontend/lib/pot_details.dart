import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PotDetails extends StatelessWidget {
  final int potId;
  const PotDetails(this.potId, {super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("loading pot details for pot $potId");
    return Scaffold(body: SafeArea(child: Text("pot details for pot $potId")));
  }
}
