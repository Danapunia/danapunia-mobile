part of '../../pages/view.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomePageController());

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: const [
          Center(
            child: Text('HOMEPAGE'),
          )
        ],
      ),
    );
  }
}
