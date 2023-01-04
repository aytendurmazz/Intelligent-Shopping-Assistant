import 'package:assistant/controller/ProductController.dart';
import 'package:assistant/controller/StandController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../components/product_card.dart';
import '../../../components/section_tile.dart';
import '../../../model/Product.dart';
import '../../../uiprinciples/size_config.dart';
import '../../details/details_screen.dart';

class ProductBanner extends StatefulWidget {
  final String sNumber;
  final String pazarName;

  ProductBanner({
    Key key,
    this.sNumber,
    this.pazarName,
  }) : super(key: key);

  @override
  State<ProductBanner> createState() => _ProductBannerState();
}

class _ProductBannerState extends State<ProductBanner> {
  ProductController productController = ProductController();

  StandController standController = StandController();

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    var total = 0.0;
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
          child: SectionTitle(title: "Ürünlerimiz", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: getProportionateScreenWidth(
                    500), // <-- you should put some value here
                child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: productController.getStream(
                      widget.pazarName, widget.sNumber),
                  builder: (_, snapshot) {
                    if (snapshot.hasError)
                      return Text('Error = ${snapshot.error}');
                    if (snapshot.hasData) {
                      snapshot.data.docs.forEach((result) {
                        total += (result.data()['productRate'] /
                            result.data()['voteCounter']);
                      });
                      standController.updateStandRate(widget.pazarName,
                          widget.sNumber, total / (snapshot.data.docs.length));
                      final docs = snapshot.data.docs;
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 150,
                          childAspectRatio: 1 / 1.5,
                          crossAxisSpacing: 25,
                        ),
                        physics: ScrollPhysics(),
                        itemCount: docs.length,
                        itemBuilder: (_, i) {
                          final data = docs[i].data();
                          Product p1 = Product(
                              id: data['pID'],
                              price: data['price'],
                              title: data['pTitle'],
                              description: data['pDescription'],
                              isFavourite: data['isFavourite'],
                              images: data['pImage'],
                              productRate: data['productRate'],
                              voteCounter: data['voteCounter']);

                          return InkWell(
                              onTap: () {
                                total = 0.0;
                                Navigator.pushNamed(
                                    context, DetailsScreen.routeName,
                                    arguments: ProductDetailsArguments(
                                        product: p1,
                                        pazarName: widget.pazarName,
                                        standName: widget.sNumber,
                                        productID: docs[i].id.toString()));
                              },
                              child: ProductCard(
                                  product: p1,
                                  pazarName: widget.pazarName,
                                  standName: widget.sNumber,
                                  productName: docs[i].id.toString()));
                        },
                      );
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
