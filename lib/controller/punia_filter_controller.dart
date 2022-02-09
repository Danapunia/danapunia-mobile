part of '_controller.dart';

class PuniaFilterController extends GetxController {
  final selectedCategory = PuniaCategory(
    id: -1,
    name: 'Semua Kategori',
    selected: true,
  ).obs;

  void categoryOnSelected(int index) {
    final puniaCategory = Get.find<PuniaCategoryController>();
    final data = puniaCategory.data.value!.data;

    if (data[index].id == selectedCategory.value.id) {
      return;
    }

    for (var i = 0; i < data.length; i++) {
      data[i].selected = false;
    }

    data[index].selected = !data[index].selected;
    selectedCategory.value = data[index];

    update();
  }
}
