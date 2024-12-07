import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_cubit.dart'; // Make sure the CartCubit is imported
import 'cart_item.dart'; // Make sure CartItem is imported

class ProductDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> product;

  ProductDetailsScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Image.network(product['image'], fit: BoxFit.cover),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                product['title'],
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '\$${product['price']}',
                style: TextStyle(fontSize: 16, color: Colors.green),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Description: ${product['description']}',
                style: TextStyle(fontSize: 14),
              ),
            ),

            // Add to Cart Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Convert Map to CartItem
                  final cartItem = CartItem(
                    title: product['title'],
                    price: product['price'],
                    image: product['image'],
                    quantity: 1, // Default quantity to 1
                  );

                  // Call addToCart with CartItem
                  context.read<CartCubit>().addToCart(cartItem);

                  // Show a confirmation message
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text('${product['title']} added to cart')),
                  );
                },
                child: Text('Add to Cart'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors
                      .orange, // Corrected: use backgroundColor instead of primary
                  padding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
