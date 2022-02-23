part of '_component.dart';

class DetailPageDescription extends StatelessWidget {
  const DetailPageDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailPageController>(
      builder: (_) => Container(
        alignment: Alignment.center,
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: ReadMoreText(
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
          trimLines: 2,
          colorClickableText: Colors.pink,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'Show more',
          trimExpandedText: 'Show less',
          style: GoogleFonts.inter(
            // fontSize: 12,
            // fontWeight: FontWeight.w500,
          ),
          moreStyle: GoogleFonts.inter(
            fontSize: 12,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
