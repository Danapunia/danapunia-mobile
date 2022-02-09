part of '_component.dart';

class HomePagePuniaList extends StatelessWidget {
  const HomePagePuniaList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<PuniaProgramController>(
      init: PuniaProgramController(),
      builder: (_) => ListView.builder(
        shrinkWrap: true,
        controller: ScrollController(),
        itemCount: _.data.value?.data.length,
        itemBuilder: (ctx, i) => _card(_.data.value!.data[i]),
      ),
    );
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
