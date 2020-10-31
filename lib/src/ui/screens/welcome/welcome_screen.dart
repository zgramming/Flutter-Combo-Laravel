import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/providers.dart';

import '../form_product/form_product_screen.dart';

import 'widgets/drawer_side.dart';
import 'widgets/list_products.dart';

class WelcomeScreen extends StatelessWidget {
  static const routeNamed = '/welcome-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Aplikasi CRUD Laravel'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              builder: (ctx) => FormProductScreen(),
            ),
          ),
        ],
      ),
      drawer: DrawerSide(),
      body: Consumer(builder: (_, watch, __) {
        final productsFuture = watch(showProducts);
        final products = watch(productProvider.state);
        return productsFuture.when(
          data: (_) {
            return ListProducts(products: products);
          },
          loading: () => Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, stackTrace) => Center(
            child: Text(error.toString()),
          ),
        );
      }),
    );
  }
}
