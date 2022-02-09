part of '_controller.dart';

class PuniaSearchController extends GetxController {
  // List<PuniaProgram> data = [];
  var data = <PuniaProgram>[].obs;

  Future<void> searchPunia(String keyword) async {
    print(keyword);
    data.value = await Services.searchPuniaProgram(keyword);
    update();
  }
}
