part of '_component.dart';

class HomePagePuniaList extends StatelessWidget {
  const HomePagePuniaList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<HomePageController>();

    return GetX<PuniaProgramController>(
      init: PuniaProgramController(),
      builder: (_) => ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 0),
        shrinkWrap: true,
        controller: ScrollController(),
        itemCount: _.data.value?.data.length,
        itemBuilder: (ctx, i) => PuniaCardWidget(
          data: _.data.value!.data[i],
          onTap: () => ctrl.cardOnClick(_.data.value!.data[i]),
        ),
      ),
    );
  }
}
