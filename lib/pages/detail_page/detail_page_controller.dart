part of '../../pages/controller.dart';

class DetailPageController extends GetxController {
  PuniaProgram? data;
  bool isLoading = true;

  void goToPage(PuniaProgram data) {
    isLoading = true;

    Get.to(() => const DetailPageView());
    this.data = data;

    isLoading = false;
    update();
  }

}
