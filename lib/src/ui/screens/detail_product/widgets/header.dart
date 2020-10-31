import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';

import '../../../../network/model/models.dart';

class HeaderDetail extends StatelessWidget {
  const HeaderDetail({
    Key key,
    @required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
            child: ShowImageNetwork(
              imageUrl: appConfig.baseImageURL + '/produk/' + product.imageProduct,
              imageSize: 5,
              fit: BoxFit.cover,
            ),
            fit: FlexFit.tight),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  product.name,
                  style: appTheme.headline6(context),
                ),
                SizedBox(height: 10),
                Text(
                  'Rp ' + GlobalFunction.formatNumber(product.price.toInt()),
                  style: appTheme.bodyText1(context).copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorPallete.accentColor,
                      ),
                ),
                SizedBox(height: 10),
                RichText(
                  textAlign: TextAlign.right,
                  text: TextSpan(
                    text: 'Stok : ',
                    style: appTheme.subtitle1(context),
                    children: [
                      TextSpan(
                        text: product.stock.toString(),
                        style: appTheme.headline5(context),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          flex: 2,
        ),
      ],
    );
  }
}
