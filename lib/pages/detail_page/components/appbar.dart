part of '_component.dart';

class DetailPageAppBar extends StatelessWidget {
  const DetailPageAppBar({
    Key? key,
    required this.innerBoxIsScrolled,
  }) : super(key: key);

  final bool innerBoxIsScrolled;

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = AppBar().preferredSize.height;
    final ctrl = Get.find<DetailPageController>();

    return SliverAppBar(
      title: innerBoxIsScrolled
          ? Text(
              ctrl.punia!.name!,
              style: TextStyle(
                color: innerBoxIsScrolled ? Colors.black : Colors.white,
              ),
            )
          : null,
      leading: IconButton(
        padding: const EdgeInsets.all(0),
        splashRadius: 20,
        icon: Icon(
          Icons.arrow_back_outlined,
          color: innerBoxIsScrolled ? Colors.black : Colors.white,
        ),
        onPressed: Get.back,
      ),
      floating: true,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            if (ctrl.punia!.imageURL != null)
              Image.network(
                '$imageURL${ctrl.punia!.imageURL}',
                fit: BoxFit.cover,
              ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black87, Colors.transparent],
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                ),
              ),
            ),
          ],
        ),
      ),
      expandedHeight: Get.width - statusBarHeight,
    );
  }
}
