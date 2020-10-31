import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:global_template/global_template.dart';

import '../../../functions/functions.dart';
import '../../../providers/providers.dart';

class FormProductScreen extends StatefulWidget {
  final int idProduct;
  FormProductScreen({this.idProduct});
  @override
  _FormProductScreenState createState() => _FormProductScreenState();
}

class _FormProductScreenState extends State<FormProductScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameTextController = TextEditingController();
  TextEditingController priceTextController = TextEditingController();
  TextEditingController stockTextController = TextEditingController();
  TextEditingController summaryTextController = TextEditingController();
  TextEditingController descriptionTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.idProduct != null) {
      final productEdit = context.read(singleProduct(widget.idProduct)).state;
      print(productEdit);
      nameTextController = TextEditingController(text: productEdit.name);
      priceTextController =
          TextEditingController(text: GlobalFunction.formatNumber(productEdit.price.toInt()));
      stockTextController = TextEditingController(text: productEdit.stock.toString());
      summaryTextController = TextEditingController(text: productEdit.summary);
      descriptionTextController = TextEditingController(text: productEdit.description);
    }
  }

  String _imageBase64;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: (sizes.height(context) * 0.9),
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      padding: const EdgeInsets.all(14.0),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Form Produk',
                textAlign: TextAlign.center,
                style: appTheme.headline5(context),
              ),
              SizedBox(height: 10),
              if (_imageBase64 == null) ...[
                SizedBox(),
              ] else ...[
                Image.memory(base64Decode(_imageBase64), height: 100)
              ],
              SizedBox(height: 10),
              TextFormFieldCustom(
                controller: nameTextController,
                hintText: 'Samsung Note 20+',
                labelText: 'Nama Produk',
                prefixIcon: Icon(Icons.gavel),
              ),
              SizedBox(height: 10),
              TextFormFieldCustom(
                controller: priceTextController,
                hintText: '10,000,000',
                labelText: 'Harga',
                keyboardType: TextInputType.number,
                prefixIcon: Icon(Icons.money),
                inputFormatter: [
                  InputNumberFormat(),
                ],
              ),
              SizedBox(height: 10),
              TextFormFieldCustom(
                controller: stockTextController,
                hintText: '*',
                labelText: 'Stok',
                keyboardType: TextInputType.number,
                inputFormatter: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                prefixIcon: Icon(Icons.airport_shuttle),
              ),
              SizedBox(height: 10),
              TextFormFieldCustom(
                controller: summaryTextController,
                maxLines: 3,
                hintText: 'Masukkan ringkasan tentang produk ini',
                labelText: 'Ringkasan',
                prefixIcon: Icon(Icons.text_fields_outlined),
              ),
              SizedBox(height: 10),
              TextFormFieldCustom(
                controller: descriptionTextController,
                maxLines: 3,
                hintText: 'Masukkan deskripsi mengenai produk ini',
                labelText: 'Deskripsi',
                prefixIcon: Icon(Icons.text_fields),
              ),
              SizedBox(height: 10),
              if (widget.idProduct == null) ...[
                OutlineButton.icon(
                  onPressed: () async {
                    final String resultImage = await CommonFunction.pickImage(
                      isCameraSource: false,
                      returnFile: ReturnFile.BASE64,
                    );
                    setState(() {
                      _imageBase64 = resultImage;
                    });
                  },
                  icon: Icon(Icons.photo),
                  label: Text('Pilih Gambar'),
                ),
                SizedBox(height: 10),
              ],
              ProviderListener(
                provider: globalLoading,
                onChange: (context, loading) async {
                  if (loading.state) {
                    await GlobalFunction.showDialogLoading(context);
                  } else {
                    Navigator.of(context).pop();
                  }
                },
                child: ButtonCustom(
                  onPressed: () async => await RequestFunction.addProduct(
                    context,
                    idProduct: widget.idProduct,
                    formKey: _formKey,
                    nameTextController: nameTextController,
                    priceTextController: priceTextController,
                    stockTextController: stockTextController,
                    summaryTextController: summaryTextController,
                    descriptionTextController: descriptionTextController,
                    imageBase64: _imageBase64,
                  ),
                  buttonTitle: 'Simpan',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
