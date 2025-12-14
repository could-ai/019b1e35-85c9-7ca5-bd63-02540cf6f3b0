import 'package:flutter/material.dart';

class BookCoverScreen extends StatelessWidget {
  const BookCoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // A5 Aspect Ratio: 148mm / 210mm ≈ 0.704
    const double a5AspectRatio = 148 / 210;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('تصميم غلاف كتاب - لغتي'),
        backgroundColor: const Color(0xFF007A3D),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('يمكنك أخذ لقطة شاشة (Screenshot) للتصميم الآن')),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                'معاينة تصميم A5',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 10),
              // The Book Cover Container
              AspectRatio(
                aspectRatio: a5AspectRatio,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      // Background Pattern (Abstract Shapes)
                      Positioned(
                        top: 0,
                        left: 0,
                        child: CustomPaint(
                          size: const Size(200, 200),
                          painter: CornerPatternPainter(),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Transform.rotate(
                          angle: 3.14159, // 180 degrees
                          child: CustomPaint(
                            size: const Size(200, 200),
                            painter: CornerPatternPainter(),
                          ),
                        ),
                      ),
                      
                      // Main Content
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 30),
                          // Header
                          const Text(
                            'المملكة العربية السعودية',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF007A3D),
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'وزارة التعليم',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          
                          const Spacer(flex: 1),
                          
                          // Central Graphic Placeholder (Book Icon)
                          Center(
                            child: Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xFFE8F5E9),
                                border: Border.all(color: const Color(0xFF007A3D), width: 2),
                              ),
                              child: const Icon(
                                Icons.menu_book_rounded,
                                size: 60,
                                color: Color(0xFF007A3D),
                              ),
                            ),
                          ),
                          
                          const Spacer(flex: 1),
                          
                          // Title
                          const Text(
                            'لُغَتِي',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFF007A3D),
                              height: 1.0,
                              shadows: [
                                Shadow(
                                  offset: Offset(2, 2),
                                  blurRadius: 3.0,
                                  color: Colors.black12,
                                ),
                              ],
                            ),
                          ),
                          const Text(
                            'الجميلة',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFD4AF37), // Gold color
                            ),
                          ),
                          
                          const Spacer(flex: 2),
                          
                          // Footer Info
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 40),
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: const Color(0xFF007A3D),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Column(
                              children: [
                                Text(
                                  'الصف الرابع الابتدائي',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'الفصل الدراسي الأول',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          
                          const SizedBox(height: 30),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom Painter for decorative corners
class CornerPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF007A3D).withOpacity(0.1)
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.5, 0, size.height);
    path.close();

    canvas.drawPath(path, paint);
    
    final paint2 = Paint()
      ..color = const Color(0xFFD4AF37).withOpacity(0.2)
      ..style = PaintingStyle.fill;
      
    final path2 = Path();
    path2.moveTo(0, 0);
    path2.lineTo(size.width * 0.7, 0);
    path2.quadraticBezierTo(size.width * 0.3, size.height * 0.3, 0, size.height * 0.7);
    path2.close();
    
    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
