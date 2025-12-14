import 'package:flutter/material.dart';
import 'book_cover_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'تصميم غلاف كتاب',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF007A3D)),
        useMaterial3: true,
        fontFamily: 'Arial', // Fallback for Arabic
      ),
      // Important: Set locale to Arabic for RTL layout
      locale: const Locale('ar', 'SA'),
      supportedLocales: const [Locale('ar', 'SA'), Locale('en', 'US')],
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
      initialRoute: '/',
      routes: {
        '/': (context) => const BookCoverScreen(),
      },
    );
  }
}
