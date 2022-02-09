part of '../../pages/controller.dart';

class HomePageController extends GetxController {
  bool isLoadingInit = true;
  bool isLoading = false;
  RefreshController refreshController = RefreshController(
    initialRefresh: false,
  );

  final puniaCategory = Get.put(PuniaCategoryController());
  final puniaProgram = Get.put(PuniaProgramController());
  final puniaFilter = Get.put(PuniaFilterController());

  @override
  void onInit() {
    super.onInit();

    ever(puniaCategory.data, (_) => checkData);
    ever(puniaProgram.data, (_) => checkData);

    ever(puniaFilter.selectedCategory, (_) => selectedCategoryChanged);
  }

  void get selectedCategoryChanged async {
    isLoading = true;

    await refreshData();

    isLoading = false;
    update();
  }

  void get checkData {
    if (isValid) {
      isLoadingInit = false;
      update();
    }
  }

  void searchOnClick() {
    showSearch(
      context: Get.context!,
      delegate: SearchPage<PuniaProgram>(
        items: puniaProgram.data.value!.data,
        builder: (t) => Text(t.name!),
        filter: (t) => [t.name],
      ),
    );
  }

  bool get isValid {
    return puniaCategory.isDataNotEmpty && puniaProgram.isDataNotEmpty;
  }

  Future<void> refreshData() async {
    await puniaProgram.fetchAPI(
      categoryId: puniaFilter.selectedCategory.value.id,
    );
    refreshController.refreshCompleted();
  }

  Future<void> loadNextData() async {
    await puniaProgram.loadNextData();
    refreshController.loadComplete();
  }
}
