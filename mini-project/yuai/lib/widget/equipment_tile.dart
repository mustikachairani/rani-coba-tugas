import 'package:flutter/material.dart';

class EquipmentTile extends StatelessWidget {
  final Map<String, dynamic> equipment;
  final Icon icon;
  final VoidCallback onPressed;

  EquipmentTile({required this.equipment, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    // Menangani nilai null pada 'name' dan 'image'
    String name = equipment['name'] ?? 'Unknown';
    String image = equipment['image'] ?? 'default_image_url';

    return Container(
      decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsetsDirectional.only(bottom: 10, start: 25, end: 25),
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      child: ListTile(
        title: Text(name),
        leading: Image.network(image),
        trailing: IconButton(
          icon: icon,
          onPressed: onPressed,
        ),
      ),
    );
  }
}

