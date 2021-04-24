import 'package:flutter/material.dart';
import 'package:ifood_flutter_clone/controllers/content_controller.dart';
import 'package:ifood_flutter_clone/core/theme/app_icons.dart';
import 'package:ifood_flutter_clone/models/category.dart';
import 'package:ifood_flutter_clone/views/content/components/bottom_navigator_component.dart';
import 'package:ifood_flutter_clone/views/content/components/category_item_component.dart';

import 'components/content_tap_bar_component.dart';
import 'components/header_location_component.dart';

class ContentPage extends StatefulWidget {
  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  final controller = ContentController();
  List<CategoryModel> categories;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    categories = controller.getCategories();
    super.initState();
  }

  int _currentIdex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          physics: BouncingScrollPhysics(),
          headerSliverBuilder: (_, __) => [
            HeaderLocationComponent(location: 'Rua das Flores do Campo, 10'),
            ContentTabBarComponent(
                tabController: tabController, onTap: (index) {}),
          ],
          body: Column(
            children: [
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () => Future.delayed(Duration(seconds: 3)),
                  child: CustomScrollView(
                    physics: BouncingScrollPhysics(),
                    slivers: [
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: 86,
                          child: ListView.builder(
                            itemCount: categories.length,
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index) => Padding(
                                padding: EdgeInsets.only(
                                  left: index == 0 ? 16 : 0,
                                  right:
                                      index == categories.length - 1 ? 16 : 10,
                                ),
                                child: CategoryItemComponent(
                                    category: categories[index])),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              BottomNavigatorComponent(
                onTap: (int index) {
                  if (index == _currentIdex) return;
                  setState(() {
                    _currentIdex = index;
                  });
                },
                currentIndex: _currentIdex,
                items: [
                  BottomNavigatorItemComponent(
                    label: 'Inicio',
                    activeIcon: AppIcons.homeActive,
                    icon: AppIcons.home,
                    isActive: true,
                  ),
                  BottomNavigatorItemComponent(
                    label: 'Busca',
                    activeIcon: AppIcons.searchActive,
                    icon: AppIcons.search,
                    isActive: false,
                  ),
                  BottomNavigatorItemComponent(
                    label: 'Pedidos',
                    activeIcon: AppIcons.ordersActive,
                    icon: AppIcons.orders,
                    isActive: false,
                  ),
                  BottomNavigatorItemComponent(
                    label: 'Perfil',
                    activeIcon: AppIcons.profileActive,
                    icon: AppIcons.profile,
                    isActive: false,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
