import 'package:ecommerce_app/components/my_botton.dart';
import 'package:ecommerce_app/components/my_drawer.dart';
import 'package:ecommerce_app/models/products.dart';
import 'package:ecommerce_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  // remove from cart
  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (contex) => AlertDialog(
        content: const Text(
          "Remove item From your cart?",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        actions: [
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "Cancel",
              style: TextStyle(color: Color.fromARGB(255, 212, 120, 113)),
            ),
          ),
          MaterialButton(
            // pop dialogue box
            onPressed: () {
              Navigator.pop(context);
              contex.read<Shop>().removeFromCart(product);
            },
            // add to cart

            child: const Text("Yes"),
          ),
        ],
      ),
    );
  }

  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content: Text(
          "User want to pay! Connect this app to your payment bankend",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // get access to the cart

    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        title: const Text("Cart Page"),
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      body: Column(
        children: [
          //cart list
          Expanded(
            child: cart.isEmpty
                ? const Center(
                    child: Text(
                    "Your cart is empty....",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ))
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      // get individual cart
                      final item = cart[index];

                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text(item.price.toStringAsFixed(2)),
                        trailing: IconButton(
                          onPressed: () => removeItemFromCart(context, item),
                          icon: const Icon(Icons.delete),
                        ),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(45.0),
            child: MyButton(
              onTap: () => payButtonPressed(context),
              child: const Text("Pay Now"),
            ),
          )
        ],
      ),
    );
  }
}
