import 'package:flutter/material.dart';
import 'package:invoice_generator/detailpage.dart';
import 'package:invoice_generator/entrypage.dart';
import 'package:invoice_generator/order.dart';
import 'package:invoice_generator/splash_screen.dart';

import 'editingpage.dart';
import 'homepage.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash',
      routes: {
        'homepage': (context) => const Homepage(),
        'splash': (context) => const Splash_Screen(),
        'orderpage': (context) => const Order_item(),
        'detailpage': (context) => const Detail_page(),
        'entrypage': (context) => const EntryPage(),
        'editpage': (context) => const Edit(),
      },
    ),
  );
}
