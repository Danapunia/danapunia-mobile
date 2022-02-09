part of '_component.dart';

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PuniaProgramController>();

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('DANAPUNIA'),
            IconButton(
              onPressed: () => showSearch(
                context: context,
                delegate: SearchPage<PuniaProgram>(
                  items: controller.data.value!.data,
                  builder: (t) => Text(t.name!),
                  filter: (t) => [t.name],
                ),
              ),
              icon: const Icon(
                Icons.search_rounded,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
