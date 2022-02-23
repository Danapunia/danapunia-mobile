part of '_component.dart';

class DetailPageOrganization extends StatelessWidget {
  const DetailPageOrganization({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<DetailPageController>();

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            ctrl.organization!.namaOrganisasi!,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
