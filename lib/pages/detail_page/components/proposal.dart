part of '_component.dart';

class DetailPageProposal extends StatelessWidget {
  const DetailPageProposal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Proposal'),
          TextButton(
            onPressed: () {},
            child: const Text('Download'),
          ),
        ],
      ),
    );
  }
}
