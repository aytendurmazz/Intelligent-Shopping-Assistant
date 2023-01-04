import 'package:assistant/controller/UserController.dart';
import 'package:assistant/model/Cart.dart';
import 'package:flutter/material.dart';

import '../../../components/default_button.dart';
import '../../../controller/CartController.dart';
import '../../../model/Product.dart';
import '../../../uiprinciples/size_config.dart';
import 'product_description.dart';
import 'product_images.dart';
import 'top_rounded_container.dart';

int number = 0;

class Body extends StatelessWidget {
  final Product product;
  final String pazarName;
  final String standName;
  final String productID;
  UserController userController = UserController();
  CartController cartController = CartController();

  Body({Key key, this.product, this.pazarName, this.standName, this.productID})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductImages(product: product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: product,
                productID: productID,
                pazarName: pazarName,
                standName: standName,
              ),
              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15),
                        ),
                        child: DefaultButton(
                          text: "Sepete Ekle",
                          press: () {
                            number = 1;
                            userController.createCart2(
                                Cart(
                                    product: Product(
                                        description: product.description,
                                        price: product.price,
                                        isFavourite: product.isFavourite,
                                        images: product.images,
                                        id: product.id,
                                        title: product.title),
                                    numOfItem: number),
                                pazarName,
                                standName);
                            /*userController.createCart(Cart(
                                product: Product(
                                    description: product.description,
                                    price: product.price,
                                    isFavourite: product.isFavourite,
                                    images: product.images,
                                    id: product.id,
                                    title: product.title),
                                numOfItem: number));*/
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
