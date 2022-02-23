part of '../../pages/controller.dart';

class RegisterPopupController extends GetxController {
  PuniaRegister data = PuniaRegister();
  List<PuniaAmount> puniaAmount = [
    PuniaAmount(100000),
    PuniaAmount(500000),
    PuniaAmount(1000000),
  ];
  PuniaAmount selectedPuniaAmount = PuniaAmount(-1);

  final punia = Get.find<DetailPageController>();

  void nextOnClick() {
    Get.back();
    Get.to(() => const ConfirmationPage());
    // dispose();
  }

  void closePopup() {
    Get.back();
    dispose();
  }

  void onSelectedPuniaAmount(int index) {
    if (puniaAmount[index].amount == selectedPuniaAmount.amount) {
      return;
    }

    for (var i = 0; i < puniaAmount.length; i++) {
      puniaAmount[i].isSelected = false;
    }
    puniaAmount[index].isSelected = !puniaAmount[index].isSelected;
    data.puniaAmount.text = currency(puniaAmount[index].amount);

    update();
  }

  @override
  void dispose() {
    Get.delete<RegisterPopupController>();
    super.dispose();
  }

  void openPopup() => Get.dialog(const RegisterPopupView());
}
