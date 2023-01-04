import 'package:flutter/material.dart';

import '../model/Pazar.dart';
import '../uiprinciples/constant.dart';
import '../uiprinciples/size_config.dart';

class PazarCard extends StatelessWidget {
  const PazarCard({
    Key key,
    this.width = 140,
    this.aspectRetio = 1.02,
    this.pazar,
  }) : super(key: key);

  final double width, aspectRetio;
  final Pazar pazar;

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
            AspectRatio(
              aspectRatio: 1.02,
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                decoration: BoxDecoration(
                  color: kSecondaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Hero(
                  tag: pazar.id.toString(),
                  child: Image.network(pazar.image),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              pazar.title,
              style: TextStyle(color: Colors.black),
              maxLines: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  pazar.day,
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(18),
                    fontWeight: FontWeight.w600,
                    color: kPrimaryColor,
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
