import 'package:flutter/material.dart';
import 'package:ifood_flutter_clone/core/theme/app_colors.dart';
import 'package:ifood_flutter_clone/core/theme/app_typography.dart';
import 'package:ifood_flutter_clone/models/category.dart';

class CategoryItemComponent extends StatelessWidget {
  final CategoryModel category;

  const CategoryItemComponent({this.category});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          child: Image.asset(category.picture ?? '', height: 60),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(
            category.name ?? '',
            style: AppTypography.small(context).copyWith(
              color: AppColors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
