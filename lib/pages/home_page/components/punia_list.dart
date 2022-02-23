part of '_component.dart';

class HomePagePuniaList extends StatelessWidget {
  const HomePagePuniaList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<HomePageController>();

    return GetX<PuniaProgramController>(
      init: PuniaProgramController(),
      builder: (_) => ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 0),
        shrinkWrap: true,
        controller: ScrollController(),
        itemCount: _.data.value!.data.length,
        itemBuilder: (ctx, i) => PuniaCardWidget(
          data: _.data.value!.data[i],
          onTap: () => ctrl.cardOnClick(_.data.value!.data[i]),
        ),
        separatorBuilder: (ctx, i) => const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: DottedLine(
            direction: Axis.horizontal,
            lineLength: double.infinity,
            lineThickness: 0.5,
            dashLength: 4.0,
            dashColor: Colors.grey,
            dashRadius: 0.0,
            dashGapLength: 0.0,
            dashGapColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
