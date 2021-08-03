import 'package:get/get.dart';
import 'package:rock_scissor_paper/view/battle_page_view.dart';
import 'package:rock_scissor_paper/view/home_page_view.dart';

List<GetPage> pages = [
   GetPage(name: '/', page: () => HomePageView(), ),
   GetPage(name: '/battle_page', page: () => BattlePageView()),
];