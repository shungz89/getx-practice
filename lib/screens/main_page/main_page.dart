import 'package:cached_network_image/cached_network_image.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_as_sj/screens/main_page/tabs/maintab1/main_tab1.dart';

import '../../constants/colors.dart';
import 'main_page_binding.dart';
import 'main_page_controller.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainPageBinding().dependencies();
    return GetBuilder<MainPageController>(
      builder: (controller) {
        ///TODO: Remove + 20 after HK7S Ends
        double bottomSafeAreaPaddingHeight =
            MediaQuery.of(context).viewPadding.bottom +
                (controller.isHaveMainEventTab ? 20 : 0);

        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Scaffold(
            extendBody: true,
            backgroundColor: AppColors.black,
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              title: Text("GETX_PRACTICE"),
            ),
            body: ColorfulSafeArea(
              color: AppColors.transparent,
              overflowRules: OverflowRules.only(bottom: true),
              // filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Stack(children: [
                Container(
                    color: AppColors.black,
                    child: TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: controller.tabController,

                      ///Change isHaveEvent to false when event is over
                      children: _tabListWidgets(controller),
                    )
                    //controller.tabPages[controller.tabIndex],
                    ),
              ]),
            ),

            ///Navigation Bar without Circle in the middle
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              currentIndex: controller.tabIndex.value,
              onTap: controller.changeTabIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: "Search",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications),
                  label: "Notifications",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "Profile",
                ),
              ],
            )
          ),
        );
      },
    );
  }

  List<Widget> _tabListWidgets(MainPageController controller) {
    return [
      MainTab1(),
      Text("Tab2"),
      Text("Tab3"),
      Text("Tab4"),
    ];
  }
}
