import 'package:flutter/material.dart';
import 'package:ifood_flutter_clone/core/theme/app_icons.dart';
import 'package:ifood_flutter_clone/views/content/components/bottom_navigator_component.dart';

import 'components/content_tap_bar_component.dart';
import 'components/header_location_component.dart';

class ContentPage extends StatefulWidget {
  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  int _currentIdex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                HeaderLocationComponent(
                    location: 'Rua das Flores do Campo, 10'),
                ContentTabBarComponent(
                    tabController: tabController, onTap: (index) {}),
              ],
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
                label: 'Inicio',
                activeIcon: AppIcons.homeActive,
                icon: AppIcons.home,
                isActive: false,
              ),
              BottomNavigatorItemComponent(
                label: 'Inicio',
                activeIcon: AppIcons.homeActive,
                icon: AppIcons.home,
                isActive: false,
              ),
              BottomNavigatorItemComponent(
                label: 'Inicio',
                activeIcon: AppIcons.homeActive,
                icon: AppIcons.home,
                isActive: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
