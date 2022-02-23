part of '_component.dart';

class DetailPageProgres extends StatelessWidget {
  const DetailPageProgres({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<DetailPageController>();

    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Progres',
              style: GoogleFonts.inter(),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: YoutubePlayerWidget(
              initialVideoId: ctrl.youtubeVideoId[0],
              playOnYoutubeOnClick: () {
                print('ONCLICK');
              },
            ),
          ),
        ],
      ),
    );
  }
}
