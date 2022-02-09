part of '_component.dart';

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<HomePageController>();

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('DANAPUNIA',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                )),
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
