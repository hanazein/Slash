// lib/presentation/widgets/search_field.dart
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: Color(0xFFE4E4E4).withOpacity(0.52),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          ImageIcon(
            AssetImage('assets/images/img_3.png'),
            color: Color(0xff5F5F5F),
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Search here',
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
