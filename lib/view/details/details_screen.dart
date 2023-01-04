import 'package:flutter/material.dart';

import '../../model/Product.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments agrs =
        ModalRoute.of(context).settings.arguments as ProductDetailsArguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(),
      ),
      body: Body(
        product: agrs.product,
        standName: agrs.standName,
        pazarName: agrs.pazarName,
        productID: agrs.productID,
      ),
    );
  }
}

class ProductDetailsArguments {
  final Product product;
  final String pazarName;
  final String standName;
  final String productID;

  ProductDetailsArguments(
      {this.pazarName, this.standName, this.product, this.productID});
}
