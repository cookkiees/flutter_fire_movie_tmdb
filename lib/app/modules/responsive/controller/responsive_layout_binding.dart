import 'package:get/get.dart';
import 'responsive_layout_controller.dart';
import 'responsive_layout_interactor.dart';
import 'responsive_layout_worker.dart';

class ResponsiveLayoutBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResponsiveLayoutWorker>(() => ResponsiveLayoutWorker());
    Get.lazyPut<ResponsiveLayoutInteractor>(() => ResponsiveLayoutInteractor());

    Get.lazyPut<ResponsiveLayoutController>(() => ResponsiveLayoutController());
  }
}
