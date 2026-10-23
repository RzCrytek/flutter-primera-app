import 'package:flutter/material.dart';

class ItemTypeWidget extends StatelessWidget {
  final Map<String, dynamic> data;
  final bool isSelected;
  final VoidCallback? onTap;

  const ItemTypeWidget({
    super.key,
    required this.data,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.cyan.shade100 : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(16),
          border: isSelected ? Border.all(color: Colors.cyan) : null,
        ),
        child: Row(
          mainAxisSize: .min,
          children: [
            Image.asset(
              "assets/icons/${data["image"]}.webp",
              width: 40,
              height: 40,
            ),
            SizedBox(width: 8),
            Text(data["name"]),
          ],
        ),
      ),
    );
  }
}
