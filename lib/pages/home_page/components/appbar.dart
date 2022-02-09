part of '_component.dart';

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<HomePageController>();

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('DANAPUNIA'),
            IconButton(
              onPressed: ctrl.searchOnClick,
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
