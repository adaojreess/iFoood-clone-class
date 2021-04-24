import 'package:flutter/material.dart';
import 'package:ifood_flutter_clone/core/theme/app_colors.dart';
import 'package:ifood_flutter_clone/core/theme/app_typography.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class ContentTabBarComponent extends StatelessWidget {
  const ContentTabBarComponent(
      {Key key, @required this.tabController, @required this.onTap})
      : super(key: key);

  final TabController tabController;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: _ContentTabBarComponentDelegate(
        onTap: onTap,
        tabController: tabController,
      ),
    );
  }
}

class _ContentTabBarComponentDelegate extends SliverPersistentHeaderDelegate {
  final TabController tabController;
  final Function(int) onTap;

  const _ContentTabBarComponentDelegate(
      {@required this.tabController, @required this.onTap});

  @override
  Widget build(Object context, double shrinkOffset, bool overlapsContent) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 160),
      child: TabBar(
        labelPadding: EdgeInsets.zero,
        indicatorPadding: EdgeInsets.zero,
        onTap: onTap,
        indicator: MaterialIndicator(
          color: AppColors.primaryColor,
          height: 2,
          bottomLeftRadius: 5,
          bottomRightRadius: 5,
        ),
        controller: tabController,
        labelColor: AppColors.primaryColor,
        unselectedLabelColor: AppColors.black54,
        labelStyle: AppTypography.tabBarStyle(context),
        tabs: [
          Tab(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Restaurantes'),
            ),
          ),
          Tab(
            child: Text('Mercados'),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
