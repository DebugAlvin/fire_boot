import 'package:fire_boot/base/getx/base_controller.dart';
import 'package:fire_boot/pages/main/widget/main_page_bottom_bar_controller.dart';
import 'package:get/get.dart';
import 'code.dart';

class MainLogic extends BaseController {


  final bottomBarController = MainPageBottomBarController();

  final _selectedMenuCodeController = MenuCode.HOME.obs;

  MenuCode get selectedMenuCode => _selectedMenuCodeController.value;

  final lifeCardUpdateController = false.obs;

  onMenuSelected(MenuCode menuCode) async => _selectedMenuCodeController(menuCode);

  selectedMenu(MenuCode code) {
    onMenuSelected(code);
    bottomBarController.selectedAtIndex(code.index);
  }

}
