import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/scale_button.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFF223649))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              Icon(Icons.change_history, color: Colors.white, size: 20),
              SizedBox(width: 8),
              Text(
                "Boritheareach's Portfolio",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Row(
            children: [
              _navLink('About'),
              _navLink('Projects'),
              _navLink('Contact'),
              const SizedBox(width: 16),
              ScaleButton(
                child: const CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuDX2XMukr6N6SSINu7J1fDr5W8GZAzOJmQ508mrSv4rIma9VlRAs_AqITYnPDtq3MTjdPEg9P2LsVNV09RDCad87xxwZEdJjXkYW3pdTYQG9Pxs28MfI-m9m6tFVmYBDG3V72iPQdWunj6EW81q8UQ4uc-WB2G6hJZRZn6rQiRw3E7EmUkC0zwzgATuvQWajNsi56Ne3qk24xPTmVyUe9q5QC5zoQj5xbsLyqdZEWeHkBga8y5KHwWDbPWkepTzLdIK8luef_96tM9W',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _navLink(String title) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: TextButton(
      onPressed: () {},
      child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 14),
      ),
    ),
  );
}
