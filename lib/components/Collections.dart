import 'package:flutter/material.dart';

class Collections extends StatelessWidget {
  const Collections({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 30),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 140,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              String assetName = '';
              String modelName = '';

              if (index == 0) {
                assetName =
                    'https://www.gurlekgumruk.com/Content/Images/news/kuruyemis-fiyatlari-artti-800x480.jpg';
                modelName = 'Kuruyemiş';
              } else if (index == 1) {
                assetName =
                    'https://w7.pngwing.com/pngs/267/845/png-transparent-hand-painted-green-fish-hand-drawing-jumping-fish-fish.png';
                modelName = 'Balık';
              } else if (index == 2) {
                assetName =
                    'https://rbg24.ru/images/news/6478_turkiyeden-yas-sebze-meyve-bekleniyor_0.png';
                modelName = 'Sebze';
              } else if (index == 3) {
                assetName =
                    'https://cdn.pixabay.com/photo/2017/02/17/19/21/fruit-2074983_960_720.jpg';
                modelName = 'Meyve';
              }
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: InkWell(
                        onTap: () {},
                        child: Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(assetName),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.all(
                                Radius.circular(60),
                              )),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15, top: 10),
                    child: Text(
                      modelName,
                      style: TextStyle(
                          fontWeight:
                              index == 0 ? FontWeight.w600 : FontWeight.w500),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
