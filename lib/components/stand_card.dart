import 'package:flutter/material.dart';

import '../model/Stand.dart';
import '../uiprinciples/constant.dart';
import '../uiprinciples/size_config.dart';

class StandCard extends StatelessWidget {
  const StandCard({
    Key key,
    this.width = 140,
    this.aspectRetio = 1.02,
    this.stand,
  }) : super(key: key);

  final double width, aspectRetio;
  final Stand stand;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: getProportionateScreenWidth(10),
          right: getProportionateScreenWidth(10)),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              stand.title,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              maxLines: 2,
            ),
            Text(
              "Ürün Ortalaması ${(stand.standRate).toStringAsFixed(2)}",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(15),
                fontWeight: FontWeight.w600,
                color: Colors.amber,
              ),
            ),
            AspectRatio(
              aspectRatio: 1.02,
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                decoration: BoxDecoration(
                  color: kSecondaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Hero(
                  tag: stand.id.toString(),
                  child: Image.network(stand.image),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
