part of '../../pages/controller.dart';

class DetailPageController extends GetxController {
  PuniaProgram? punia;
  Organization? organization;
  bool isLoading = true;

  List<String> youtubeVideoId = [
    '1qmhFvnqNaU',
    'GgDLuuiKVPs',
    '_OW30kEHcZo',
  ];

  Future<bool> back() async {
    Get.back();
    dispose();

    return false;
  }

  @override
  void dispose() {
    Get.delete<RegisterPopupController>();
    Get.delete<DetailPageController>();
    super.dispose();
  }

  void goToPage(PuniaProgram data) async {
    isLoading = true;

    Get.to(() => const DetailPageView());
    punia = data;
    await fetchOrganization;

    isLoading = false;
    update();
  }

  Future<void> get fetchOrganization async {
    if (punia?.organizationId != null) {
      organization = await Services.getOrganization(punia!.organizationId!);
    }
  }

  void fabOnCLick() {
    final popup = Get.put(RegisterPopupController());

    popup.openPopup();
  }
}
