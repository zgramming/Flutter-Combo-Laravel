import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:global_template/global_template.dart';

import '../../../providers/providers.dart';

import 'widgets/header.dart';

class DetailProduct extends ConsumerWidget {
  final int idProduct;
  DetailProduct({@required this.idProduct});
  static const routeNamed = '/detail-product';
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final product = watch(singleProduct(idProduct)).state;
    if (product == null) {
      return Center(
        child: Text('null'),
      );
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Detail Produk'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HeaderDetail(product: product),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'Deskripsi produk',
                style: appTheme.headline6(context),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                product.description,
                style: appTheme.bodyText2(context),
              ),
            )
          ],
        ),
      ),
    );
  }
}
