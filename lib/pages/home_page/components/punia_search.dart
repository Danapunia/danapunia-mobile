part of '_component.dart';

class HomePagePuniaSearch extends StatelessWidget {
  const HomePagePuniaSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        decoration: const InputDecoration(
          labelText: 'Cari Punia',
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 16,
          ),
        ),
      ),
    );
  }
}
