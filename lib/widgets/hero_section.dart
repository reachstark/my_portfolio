import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 480,
      padding: const EdgeInsets.all(16),
      alignment: Alignment.bottomLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: NetworkImage(
            'https://lh3.googleusercontent.com/aida-public/AB6AXuB-LbAiwj9Tc6EnLeNXMdm3D9gIcQZ4vgHuXYkJjr4kB4rNGuc_jkn9KIFu-PflAZqjTQLbiJMqU8d083rqO0bK5AfGihrRQNTRSRM1pL1rJyebqry0hv6v6PMygHQaeJHZB7jNJEMlS7gbCueGg1Lvy6F30w_PoiryJKbnmKkSqSPzumRUWfLwG0NQVmb-FtZF6MXtr8LYvnl_qfvrtVj_au1f9MeSUuB8YDdZjY17ngyPHQ2rc5UFAGaL4fqa1QTHYmp85ZdSX3Gg',
          ),
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
        gradient: const LinearGradient(
          colors: [Color.fromRGBO(0, 0, 0, 0.1), Color.fromRGBO(0, 0, 0, 0.4)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Hi, I'm Le Boritheareach",
            style: TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'A passionate developer with a focus on creating innovative and user-friendly web applications. I love turning ideas into reality through code.',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3D98F4),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {},
            child: const Text('View Projects'),
          ),
        ],
      ),
    );
  }
}
