 import 'package:flutter/material.dart';

Widget addressCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.home, color: Colors.blue),
          const SizedBox(width: 8),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Home", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Anshas, Al-sharqia, Egypt."),
                Text("Mobile: +20 101 840 3043"),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text("Change"),
          ),
        ],
      ),
    );
  }
