import 'package:assistant/controller/ProductController.dart';
import 'package:assistant/controller/UserController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../model/Product.dart';
import '../uiprinciples/constant.dart';
import '../uiprinciples/size_config.dart';

class ProductCard extends StatefulWidget {
  ProductCard({
    Key key,
    this.width = 140,
    this.aspectRetio = 1.02,
    this.product,
    this.pazarName,
    this.standName,
    this.productName,
  }) : super(key: key);

  final double width, aspectRetio;
  final Product product;
  final String pazarName;
  final String standName;
  final String productName;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  ProductController productController = ProductController();
  UserController userController = UserController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(4)),
      child: SizedBox(
        width: getProportionateScreenWidth(widget.width),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.02,
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(5)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Hero(
                  tag: widget.product.description,
                  child: Image.network(widget.product.images),
                ),
              ),
            ),
            Text(
              widget.product.title,
              style: TextStyle(color: Colors.black),
              maxLines: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\₺${widget.product.price}",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(15),
                    fontWeight: FontWeight.w600,
                    color: kPrimaryColor,
                  ),
                ),
                widget.product.voteCounter == null
                    ? Text(
                        "${widget.product.productRate}",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(15),
                          fontWeight: FontWeight.w600,
                          color: Colors.amber,
                        ),
                      )
                    : Text(
                        "${(widget.product.productRate / widget.product.voteCounter).toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(15),
                          fontWeight: FontWeight.w600,
                          color: Colors.amber,
                        ),
                      ),
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    var x = !widget.product.isFavourite;

                    productController.updateProduct(widget.pazarName,
                        widget.standName, widget.productName, x);

                    userController.createFavList(
                        Product(
                            id: widget.product.id,
                            images: widget.product.images,
                            isFavourite: x,
                            price: widget.product.price,
                            description: widget.product.description,
                            title: widget.product.title),
                        x,
                        widget.pazarName,
                        widget.standName,
                        widget.productName);
                  },
                  child: Container(
                    padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                    height: getProportionateScreenWidth(28),
                    width: getProportionateScreenWidth(28),
                    decoration: BoxDecoration(
                      color: widget.product.isFavourite
                          ? kPrimaryColor.withOpacity(0.15)
                          : kSecondaryColor.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/Heart Icon_2.svg",
                      color: widget.product.isFavourite
                          ? Color(0xFFFF4848)
                          : Color(0xFFDBDEE4),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
