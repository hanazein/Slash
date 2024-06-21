import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final String imagePath;
  final String productName;
  final String price;

  ProductPage({
    required this.imagePath,
    required this.productName,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0), // Increased padding for better spacing
      child: Container(
        width: MediaQuery.of(context).size.width * 0.82, // Adjusted width based on screen size

        child: _buildProductItem(context, imagePath, productName, price),
      ),
    );
  }

  Widget _buildProductItem(
      BuildContext context, String imagePath, String productName, String price) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
          child: Image.asset(
            imagePath,
            width: MediaQuery.of(context).size.width * 0.5, // Adjusted width based on screen size
            height: MediaQuery.of(context).size.height * 0.2, // Adjusted height based on screen size
            fit: BoxFit.fill,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8.0),
              Text(
                productName,
                style: TextStyle(fontSize: 16, ),
              ),
              SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    price,
                    style: TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(Icons.add_circle_outline, size: 30),
                    onPressed: () {
                      // Implement your logic here for adding to cart or any action
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
