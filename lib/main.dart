// Brew Bloom App - Show coffee menu
import 'package:flutter/material.dart';

void main() {
  runApp(const BrewBloomApp());
}

class BrewBloomApp extends StatelessWidget {
  const BrewBloomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Brew & Bloom',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFAF5ED),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF795548)),
      ),
      home: const MenuScreen(),
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Brew & Bloom',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFE8D8C5),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Our Coffee Menu',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4E342E),
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Freshly brewed, made with love.',
                  style: TextStyle(color: Colors.brown),
                ),
                const SizedBox(height: 16),
                const MenuCard(
                  image: 'assets/images/iced_latte.jpg',
                  name: 'Iced Latte',
                  description: 'Smooth espresso with fresh milk.',
                  price: 'RM 12.00',
                ),
                const MenuCard(
                  image: 'assets/images/cappuccino.jpg',
                  name: 'Cappuccino',
                  description: 'Rich espresso with creamy foam.',
                  price: 'RM 10.00',
                ),
                const MenuCard(
                  image: 'assets/images/matcha_latte.jpg',
                  name: 'Matcha Latte',
                  description: 'Earthy Japanese matcha with milk.',
                  price: 'RM 13.00',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  const MenuCard({
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    super.key,
  });

  final String image;
  final String name;
  final String description;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                image,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 100,
                    height: 100,
                    color: const Color(0xFFE8D8C5),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.coffee,
                      size: 40,
                      color: Colors.brown,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    description,
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    price,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF795548),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.coffee, color: Colors.brown),
          ],
        ),
      ),
    );
  }
}
