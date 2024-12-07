import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_cubit.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Cart')),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state.items.isEmpty) {
            return Center(child: Text('Your cart is empty!'));
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    final item = state.items[index];
                    return ListTile(
                      title: Text(item.title),
                      subtitle: Text('\$${item.price} x ${item.quantity}'),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () =>
                            context.read<CartCubit>().removeFromCart(item),
                      ),
                    );
                  },
                ),
              ),
              Text('Total: \$${state.total.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 20)),
            ],
          );
        },
      ),
    );
  }
}
