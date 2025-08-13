import 'package:flutter/material.dart';
import 'package:flutter_catalouge/core/store.dart';
import 'package:flutter_catalouge/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: "Cart".text.xl.make(),
      ),
      body: Column(
        children: [_CartList().p32().expand(), Divider(), _CartTotal()],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Rebuild Happened");
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxBuilder(
            mutations: {RemoveMutation},
            builder: (context, store, status) {
              return "\$${_cart.totalPrice}".text
                  .color(context.theme.hintColor)
                  .xl4
                  .make();
            },
          ),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: "Buying not supported yet!".text.make()),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                context.theme.floatingActionButtonTheme.backgroundColor,
              ),
            ),
            child: "Buy".text.white.make(),
          ).w32(context),
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "Nothing to show".text.xl3.makeCentered()
        : ListView.builder(
          itemCount: _cart.items.length,
          itemBuilder:
              (context, index) => ListTile(
                leading: Icon(Icons.done),
                trailing: IconButton(
                  onPressed: () => RemoveMutation(_cart.items[index]).perform(),
                  icon: Icon(Icons.remove_circle_outline),
                ),
                title: _cart.items[index].name.text.make(),
              ),
        );
  }
}
