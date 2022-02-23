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
          Text(
            'Proposal',
            style: GoogleFonts.inter(),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Download',
              style: GoogleFonts.inter(),
            ),
          ),
        ],
      ),
    );
  }
}
