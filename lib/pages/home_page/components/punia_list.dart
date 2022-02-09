part of '_component.dart';

class HomePagePuniaList extends StatelessWidget {
  const HomePagePuniaList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomePageController>();

    return GetBuilder<PuniaFilterController>(
      builder: (_) => ListView.builder(
        shrinkWrap: true,
        controller: ScrollController(),
        itemCount: _.getData.length,
        itemBuilder: (ctx, i) => _card(_.getData[i]),
        // itemCount: _.data.length,
        // itemBuilder: (ctx,i)=>_card(_.data[i]),
      ),
    );
    // return Obx(
    //   () => ListView.builder(
    //     shrinkWrap: true,
    //     controller: ScrollController(),
    //     // itemCount: _.getData.length,
    //     // itemBuilder: (ctx, i) => _card(_.getData[i]),
    //     itemCount: controller.puniaFilter.data.length,
    //     itemBuilder: (ctx, i) => _card(_.data.value[i]),
    //   ),
    // );
  }

  Widget _card(PuniaProgram data) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Row(
          children: [
            Text(data.name!),
          ],
        ),
      ),
    );
  }
}
