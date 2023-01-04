import 'package:assistant/controller/ProductController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../model/Product.dart';
import '../../../uiprinciples/constant.dart';
import '../../../uiprinciples/size_config.dart';

class ProductDescription extends StatefulWidget {
  ProductDescription({
    Key key,
    this.product,
    this.pressOnSeeMore,
    this.productID,
    this.pazarName,
    this.standName,
  }) : super(key: key);

  final String productID;
  final String pazarName;
  final String standName;
  final Product product;
  final GestureTapCallback pressOnSeeMore;

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  ProductController productController = ProductController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            widget.product.title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(20),
            right: getProportionateScreenWidth(64),
          ),
          child: Text(
            widget.product.description,
            maxLines: 3,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: 10,
          ),
          child: GestureDetector(
            onTap: () {},
            child: Row(
              children: const [
                Text(
                  "Daha fazla detay gör",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: kPrimaryColor),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: kPrimaryColor,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20), vertical: 10),
          child: RatingBar.builder(
            itemSize: 30,
            initialRating: 0,
            minRating: 1,
            ignoreGestures: false,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              productController.updateProductRate(
                  widget.pazarName, widget.standName, widget.productID, rating);
            },
          ),
        ),
      ],
    );
  }
}
