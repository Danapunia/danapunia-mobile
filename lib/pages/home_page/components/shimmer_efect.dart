part of '_component.dart';
class HomePageShimmerEffect extends StatelessWidget {
  const HomePageShimmerEffect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
