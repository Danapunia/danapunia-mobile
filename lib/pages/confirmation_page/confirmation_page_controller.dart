part of '../../pages/controller.dart';

class ConfirmationPageController extends GetxController {
  bool isLoading = true;
  List<Bank> rekening = [];
  int selectedRekeningId = -1;

  final punia = Get.find<DetailPageController>();
  final dontatur = Get.find<RegisterPopupController>();

  @override
  void onInit() async {
    await callAPI();
    super.onInit();
  }

  Future<void> callAPI() async {
    rekening = [];
    isLoading = true;

    if (punia.organization != null) {
      rekening = await Services.getBankByOrganization(punia.organization!.id!);
      selectedRekeningId = rekening.first.id;
    }

    isLoading = false;

    update();
  }

  void selectedBankOnChange(int id) {
    selectedRekeningId = id;

    update();
  }

  Future<void> copyToClipBoard(Bank data) async {
    final text =
        '${data.accountName} | ${data.accountNumber} (${data.accountProvider})';

    await FlutterClipboard.copy(text);

    Get.snackbar(
      'Danapunia',
      'Nomor Rekening disalin',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void confirmationPuniaOnClick() {}
}
