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
    final controller = Get.find<DetailPageController>();

    return SliverAppBar(
      title: innerBoxIsScrolled
          ? Text(
              controller.data!.name!,
              style: TextStyle(
                color: innerBoxIsScrolled ? Colors.black : Colors.white,
              ),
            )
          : null,
      leading: IconButton(
        padding: EdgeInsets.all(0),
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
            Image.network(
              'https://picsum.photos/250?image=9',
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
      expandedHeight: MediaQuery.of(context).size.width - statusBarHeight,
    );
  }
}
