part of '_controller.dart';

class PuniaProgramController extends GetxController {
  final data = Rxn<PuniaProgramData>();

  @override
  void onInit() {
    fetchAPI();
    super.onInit();
  }

  Future<void> fetchAPI({int categoryId = -1, int page = 1}) async {
    String bodyParam = categoryId != -1
        ? '&filters[punia_categories][id][\$eq]=$categoryId'
        : '';

    final response = await Services.getPuniaProgram(
      bodyParam: bodyParam,
      page: page,
    );
    data.value = response;
  }

  Future<void> loadNextData() async {
    print('ITEMCOUNT BEFORE${data.value?.data.length}');
    final oldData = data.value;
    final page = oldData!.pagination.page + 1;
    final pageCount = oldData.pagination.pageCount;

    if (page - 1 >= pageCount) {
      return;
    }

    PuniaProgramData? newData = await Services.getPuniaProgram(page: page);

    oldData.data.addAll(newData!.data);
    oldData.pagination = newData.pagination;

    data.value = oldData;
    update();
    print('ITEMCOUNT AFTER${data.value?.data.length}');
  }

  bool get isDataNotEmpty => data.value != null && data.value!.data.isNotEmpty;
}
