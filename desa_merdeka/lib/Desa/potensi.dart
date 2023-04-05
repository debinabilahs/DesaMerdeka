import 'package:desa_merdeka/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DesaMerdeka());
}

class DesaMerdeka extends StatelessWidget {
  const DesaMerdeka({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : PotensiDesa()
    );
  }
}

class PotensiDesa extends StatelessWidget {
  const PotensiDesa({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
