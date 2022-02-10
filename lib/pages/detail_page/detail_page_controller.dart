part of '../../pages/controller.dart';

class DetailPageController extends GetxController {
  PuniaProgram? punia;
  Organization? organization;
  bool isLoading = true;

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
    final puniaRegister = Get.put(PuniaRegisterController());
    puniaRegister.punia = punia;
    puniaRegister.organization = organization;
    puniaRegister.showDialog;
  }

  YoutubePlayerController get getYoutubePlayerController {
    return YoutubePlayerController(
      initialVideoId: '1qmhFvnqNaU',
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
  }
}
