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
  final puniaSearch = Get.put(PuniaSearchController());

  @override
  void onInit() {
    super.onInit();

    ever(puniaCategory.data, (_) => checkData);
    ever(puniaProgram.data, (_) => checkData);

    ever(puniaFilter.selectedCategory, (_) => selectedCategoryChanged);
  }

  void cardOnClick(PuniaProgram data) {
    final detailPage = Get.put(DetailPageController());
    detailPage.goToPage(data);
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
        items: puniaSearch.data,
        builder: (t) => PuniaCardWidget(
          data: t,
          onTap: () => cardOnClick(t),
        ),
        filter: (t) => [t.name],
        onQueryUpdate: (keyword) => puniaSearch.searchPunia(keyword),
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
