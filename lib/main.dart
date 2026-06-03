import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/portfolio_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GoogleFonts.pendingFonts([
    GoogleFonts.nobile(),
    GoogleFonts.fustat(),
    GoogleFonts.ibmPlexMono(),
  ]);
  runApp(const PortfolioApp());
}