import 'package:assistant/view/order/order_screen.dart';
import 'package:assistant/view/selection_menu/main_screen.dart';
import 'package:flutter/cupertino.dart';

import '../view/cart/cart_screen.dart';
import '../view/complete_profile/complete_profile_screen.dart';
import '../view/details/details_screen.dart';
import '../view/favorites/favorite_screen.dart';
import '../view/forgot_password/forgot_password_screen.dart';
import '../view/home/home_screen.dart';
import '../view/login_success/login_success_screen.dart';
import '../view/pazar/pazar_screen.dart';
import '../view/profile/profile_screen.dart';
import '../view/sign_in/sign_in_screen.dart';
import '../view/sign_up/sign_up_screen.dart';
import '../view/splash/splash_screen.dart';
import '../view/stand/stand_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  PazarScreen.routeName: (context) => PazarScreen(),
  StandScreen.routeName: (context) => StandScreen(),
  FavoriteScreen.routeName: (context) => FavoriteScreen(),
  MainWidgets.routeName: (context) => MainWidgets(),
  OrderScreen.routeName: (context) => OrderScreen(),
};
