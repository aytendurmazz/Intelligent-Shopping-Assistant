import 'package:assistant/controller/AuthController.dart';
import 'package:assistant/view/order/order_screen.dart';
import 'package:assistant/view/profile/component/profile_menu.dart';
import 'package:assistant/view/profile/component/profile_pic.dart';
import 'package:flutter/material.dart';

import '../../sign_in/sign_in_screen.dart';
import '../profile_menu_screens/profile_detail/profile_detail_screen.dart';

class Body extends StatelessWidget {
  AuthController authController = AuthController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            icon:
                "https://w7.pngwing.com/pngs/950/767/png-transparent-body-jewellery-line-design-white-user-icon-svg.png",
            text: "Hesabım",
            press: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileDetail()),
              )
            },
          ),
          ProfileMenu(
            icon:
                "https://w7.pngwing.com/pngs/1019/386/png-transparent-order-fulfillment-business-service-price-business-text-service-people.png", //buraya link lazım
            text: "Geçmiş siparişlerim",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OrderScreen()),
              );
            },
          ),
          ProfileMenu(
            icon:
                "https://img2.pngindir.com/20180616/feh/kisspng-computer-icons-clip-art-dzwonek-5b257b53f24206.7417898015291830599923.jpg", //buraya link lazım
            text: "Bildirimler",
            press: () {},
          ),
          ProfileMenu(
            icon:
                "https://cdn.pixabay.com/photo/2015/12/22/04/00/edit-1103599_960_720.png", //buraya link lazım
            text: "Ayarlar",
            press: () {},
          ),
          ProfileMenu(
            icon:
                "https://miro.medium.com/max/500/1*vwkVPiu3M2b5Ton6YVywlg.png",
            text: "Yardım Merkezi",
            press: () {},
          ),
          ProfileMenu(
            icon:
                "https://png.pngtree.com/png-vector/20190419/ourmid/pngtree-vector-logout-icon-png-image_958608.jpg",
            text: "Çıkış Yap",
            press: () {
              authController.signOut();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignInScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
