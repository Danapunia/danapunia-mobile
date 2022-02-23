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
                  Text(
                    'Rp ${currency(_.punia!.collectedFund)}',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Terkumpul',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const VerticalDivider(
                thickness: 1,
                color: Colors.black,
              ),
              Column(
                children: [
                  Text(
                    'Rp ${currency(_.punia!.targetFund)}',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Target',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const VerticalDivider(
                thickness: 1,
                color: Colors.black,
              ),
              Column(
                children: [
                  Text(
                    '${_.punia!.deadline?.day}',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Sisa Hari',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
