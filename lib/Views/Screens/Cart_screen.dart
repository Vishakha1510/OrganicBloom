import 'package:flutter/material.dart';
import 'package:organicbloom/helpers/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Your Cart")),
      body: cart.items.isEmpty
          ? const Center(child: Text("Your cart is empty!"))
          : ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final item = cart.items.values.toList()[index];
                return ListTile(
                  leading: item.image.startsWith("http")
                      ? Image.network(item.image,
                          width: 50, height: 50, fit: BoxFit.cover)
                      : Image.asset(item.image,
                          width: 50, height: 50, fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.image_not_supported);
                        }),
                  title: Text(item.name),
                  subtitle: Text(
                      "Qty: ${item.quantity} | Rs.${(item.price * item.quantity)}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () => cart.removeFromCart(item.id),
                  ),
                );
              },
            ),
      bottomNavigationBar: cart.items.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  cart.clearCart();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Order placed successfully!")),
                  );
                },
                child: Text(
                    "Checkout (Rs.${cart.totalAmount.toStringAsFixed(2)})"),
              ),
            )
          : null,
    );
  }
}
