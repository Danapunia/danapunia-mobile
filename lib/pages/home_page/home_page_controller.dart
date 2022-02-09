part of '../../pages/controller.dart';

class HomePageController extends GetxController {
  bool isLoading = true;
  int initPage = 1;
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
    ever(puniaProgram.data, (_) {
      print('DATA BERTAMBAH');
    });
  }

  void get checkData {
    if (isValid) {
      final punia = puniaProgram.cacheData;
      puniaFilter.data.value = punia.data;
      isLoading = false;
      update();
    }
  }

  void get searchOnClick {}

  bool get isValid {
    return puniaCategory.isDataNotEmpty && puniaProgram.isDataNotEmpty;
  }

  Future<void> fetchApi() async {
    puniaProgram.data.value?.pagination.page = 1;

    puniaProgram.fetchAPI();

    refreshController.refreshCompleted();
    update();
  }

  Future<void> loadNextData() async {
    print('ITEMCOUNT BEFORE${puniaFilter.data.length}');
    final page = puniaProgram.data.value!.pagination.page + 1;
    final pageCount = puniaProgram.data.value?.pagination.pageCount;
    final oldData = puniaProgram.data.value;

    if (page - 1 >= pageCount!) {
      refreshController.loadComplete();
      return;
    }

    PuniaProgramData? newData = await Services.getPuniaProgram(page: page);

    oldData?.data.addAll(newData!.data);
    oldData?.pagination = newData!.pagination;

    puniaProgram.data.value = oldData;
    puniaFilter.data.value = oldData!.data;

    print('DDDDD');
    // print(puniaFilter.data.pagination.page);
    // print(puniaFilter.data.pagination.pageCount);
    print('ITEMCOUNT AFTER${puniaFilter.data.length}');

    refreshController.loadComplete();
    update();
  }
}
