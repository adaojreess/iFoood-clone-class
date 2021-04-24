import 'package:ifood_flutter_clone/core/theme/app_images.dart';
import 'package:ifood_flutter_clone/models/category.dart';

class ContentController {
  List<CategoryModel> getCategories() {
    return <CategoryModel>[
      CategoryModel(name: 'Acai', picture: AppImages.acai),
      CategoryModel(name: 'Brasileira', picture: AppImages.brasileira),
      CategoryModel(name: 'Cafe', picture: AppImages.cafe),
      CategoryModel(name: 'Doces', picture: AppImages.doces),
      CategoryModel(name: 'Japones', picture: AppImages.japones),
      CategoryModel(name: 'Lanches', picture: AppImages.lanches),
      CategoryModel(name: 'Marmita', picture: AppImages.marmita),
      CategoryModel(name: 'Mercado', picture: AppImages.mercado),
      CategoryModel(name: 'Padaria', picture: AppImages.padaria),
      CategoryModel(name: 'Pizza', picture: AppImages.pizza),
      CategoryModel(name: 'Promocoes', picture: AppImages.promocoes),
      CategoryModel(name: 'Saudavel', picture: AppImages.saudavel),
      CategoryModel(name: 'Vegetariano', picture: AppImages.vegetariano),
      CategoryModel(name: 'Vr', picture: AppImages.vr),
    ];
  }
}
