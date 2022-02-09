part of '_controller.dart';

class PuniaCategoryController extends GetxController {
  final data = Rxn<PuniaCategoryData>();

  @override
  void onInit() async {
    await fetchAPI();
    data.value?.data.insert(
      0,
      PuniaCategory(
        id: -1,
        name: 'Semua Kategori',
        selected: true,
      ),
    );

    super.onInit();
  }

  Future<void> fetchAPI() async {
    data.value = await Services.getPuniaCategory();
  }

  PuniaCategory getDataByIndex(int idx) {
    return data.value!.data[idx];
  }

  bool get isDataNotEmpty => data.value != null && data.value!.data.isNotEmpty;

  int get getLength => data.value!.data.length;
}
