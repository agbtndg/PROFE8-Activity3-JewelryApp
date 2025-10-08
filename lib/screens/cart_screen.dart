import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () {
              Provider.of<CartProvider>(context, listen: false).clearCart();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Cart cleared')),
              );
            },
          ),
        ],
      ),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          return cartProvider.items.isEmpty
              ? Center(child: Text('Your cart is empty'))
              : ListView.builder(
                  itemCount: cartProvider.items.length,
                  itemBuilder: (context, index) {
                    final item = cartProvider.items[index];
                    return ListTile(
                      title: Text('Item: ${item.name}'),
                      subtitle: Text('Material: ${item.material}'),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          cartProvider.removeItem(item.id);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Item removed from cart')),
                          );
                        },
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}