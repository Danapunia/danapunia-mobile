part of '_component.dart';

class DetailPageQuantity extends StatelessWidget {
  const DetailPageQuantity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailPageController>(
      builder: (_) => Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(_.data!.collectedFund.toString()),
                  const Text('Terkumpul'),
                ],
              ),
              const VerticalDivider(
                thickness: 1,
                color: Colors.black,
              ),
              Column(
                children: [
                  Text(_.data!.targetFund.toString()),
                  const Text('Target Punia'),
                ],
              ),
              const VerticalDivider(
                thickness: 1,
                color: Colors.black,
              ),
              Column(
                children: [
                  Text('${_.data!.deadline?.day} Hari Lagi'),
                  const Text('Tenggat'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
