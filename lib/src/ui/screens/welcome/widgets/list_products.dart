import 'package:combo_rest_api_laravel/src/ui/screens/form_product/form_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:global_template/global_template.dart';

import '../../../../functions/functions.dart';
import '../../../../network/model/models.dart';
import '../../../../providers/providers.dart';

import '../../detail_product/detail_product_screen.dart';

class ListProducts extends StatelessWidget {
  const ListProducts({
    Key key,
    @required this.products,
  }) : super(key: key);

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return ProviderListener(
      provider: globalLoading,
      onChange: (context, loading) async {
        if (loading.state) {
          await GlobalFunction.showDialogLoading(context);
        } else {
          Navigator.of(context).pop();
        }
      },
      child: ListView.builder(
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            child: ListTile(
              onTap: () {
                // print(product.idProduct);
                Navigator.of(context).pushNamed(
                  DetailProduct.routeNamed,
                  arguments: product.idProduct,
                );
              },
              onLongPress: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return ActionModalBottomSheet(
                      typeAction: TypeAction.DeleteAndEdit,
                      align: WrapAlignment.center,
                      onDelete: () async {
                        context.read(globalLoading).state = true;
                        try {
                          final result =
                              await context.read(productProvider).delete(product.idProduct);

                          await GlobalFunction.showToast(
                              message: result, toastType: ToastType.Error);
                          Future.delayed(Duration(milliseconds: 800), () {
                            Navigator.of(context).pop();
                          });
                        } catch (e) {
                          await GlobalFunction.showToast(
                            message: e.toString(),
                            toastType: ToastType.Error,
                          );
                        }
                        context.read(globalLoading).state = false;
                      },
                      onEdit: () => showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(30),
                          ),
                        ),
                        builder: (ctx) => FormProductScreen(idProduct: product.idProduct),
                      ),
                    );
                  },
                );
              },
              leading: InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return ActionModalBottomSheet(
                        typeAction: TypeAction.None,
                        align: WrapAlignment.center,
                        children: [
                          ActionCircleButton(
                            icon: Icons.camera_alt,
                            backgroundColor: colorPallete.primaryColor,
                            foregroundColor: colorPallete.white,
                            onTap: () async {
                              context.read(globalLoading).state = true;
                              try {
                                final image = await CommonFunction.pickImage(
                                  returnFile: ReturnFile.BASE64,
                                );
                                if (image != null) {
                                  final result = await context.read(productProvider).updateImage(
                                        product.idProduct,
                                        image: image,
                                      );
                                  await GlobalFunction.showToast(
                                    message: result,
                                    toastType: ToastType.Success,
                                  );
                                }
                              } catch (e) {
                                await GlobalFunction.showToast(
                                  message: e.toString(),
                                  toastType: ToastType.Error,
                                );
                              }
                              context.read(globalLoading).state = false;
                            },
                          ),
                          ActionCircleButton(
                            icon: Icons.photo,
                            backgroundColor: colorPallete.accentColor,
                            foregroundColor: colorPallete.white,
                            onTap: () async {
                              context.read(globalLoading).state = true;
                              try {
                                final image = await CommonFunction.pickImage(
                                  isCameraSource: false,
                                  returnFile: ReturnFile.BASE64,
                                );
                                if (image != null) {
                                  final result = await context.read(productProvider).updateImage(
                                        product.idProduct,
                                        image: image,
                                      );
                                  await GlobalFunction.showToast(
                                    message: result,
                                    toastType: ToastType.Success,
                                  );
                                }
                              } catch (e) {
                                await GlobalFunction.showToast(
                                  message: e.toString(),
                                  toastType: ToastType.Error,
                                );
                              }
                              context.read(globalLoading).state = false;
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: ShowImageNetwork(
                  imageSize: 1,
                  isCircle: true,
                  imageUrl: appConfig.baseImageURL + '/produk/' + product.imageProduct,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(product.name),
              subtitle: Text(
                'Rp ' + GlobalFunction.formatNumber(product.price.toInt()),
              ),
              trailing: CircleAvatar(
                child: FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      product.stock.toString(),
                      style: appTheme.subtitle1(context).copyWith(
                            color: colorPallete.white,
                          ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: products.length,
      ),
    );
  }
}
