part of '_controller.dart';

class PuniaProgramController extends GetxController {
  final data = Rxn<PuniaProgramData>();
  late PuniaProgramData cacheData;

  // final puniaFilter = Get.find<PuniaFilterController>();
  // final puniaFilter = Get.put(PuniaFilterController());

  @override
  void onInit() {
    fetchAPI();
    super.onInit();
  }

  Future<void> fetchAPI({int? categoryId}) async {
    String bodyParam = categoryId != null
        ? '&filters[punia_categories][id][\$eq]=$categoryId'
        : '';

    final response = await Services.getPuniaProgram(bodyParam: bodyParam);
    cacheData = response!;
    data.value = response;
  }

  bool get isDataNotEmpty => data.value != null && data.value!.data.isNotEmpty;
}
