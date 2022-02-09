part of '_controller.dart';

class PuniaFilterController extends GetxController {
  // late PuniaProgramData data;
  // late List<PuniaProgram> data;
  final data = RxList<PuniaProgram>();
  final selectedCategory = PuniaCategory(
    id: -1,
    name: 'Semua Kategori',
    selected: true,
  ).obs;

  final puniaCategory = Get.find<PuniaCategoryController>();
  final punia = Get.find<PuniaProgramController>();

  @override
  void onInit() {
    ever(data, (_) {
      print('PUNIA BER++');
    });
    ever(selectedCategory, (_){
      print('SELECTED BERGANTI');
    });
    super.onInit();
  }

  // void updateData() {
  //   if (selectedCategory.value.id == -1) {
  //     data.value = punia.data.value!.data;
  //   } else {
  //     data.value = punia.data.value!.data.where((element) {
  //       return element.puniaCategoryId!.contains(selectedCategory.value.id);
  //     }).toList();
  //   }
  // }

  List<PuniaProgram> get getData {
    return selectedCategory.value.id == -1
        //     ? data
        //     : data.where(
        //       (element) {
        //     return element.puniaCategoryId!
        //         .contains(selectedCategory.value.id);
        //   },
        // ).toList();
        ? punia.data.value!.data
        : punia.data.value!.data.where(
            (element) {
              return element.puniaCategoryId!
                  .contains(selectedCategory.value.id);
            },
          ).toList();
  }

  int get getItemCount {
    return data.length;
  }

  void categoryOnSelected(int index) {
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
