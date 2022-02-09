part of '_component.dart';

class HomePagePuniaFilter extends StatelessWidget {
  const HomePagePuniaFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<HomePageController>();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SizedBox(width: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(
              ctrl.puniaCategory.getLength,
              (index) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: GetBuilder<PuniaFilterController>(
                  builder: (_) => ChoiceChip(
                    onSelected: (x) => _.categoryOnSelected(index),
                    label: Text(
                      ctrl.puniaCategory.getDataByIndex(index).name,
                    ),
                    selected: ctrl.puniaCategory.getDataByIndex(index).selected,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
