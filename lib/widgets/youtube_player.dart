part of '_widgets.dart';

class YoutubePlayerWidget extends StatelessWidget {
  final Function playOnYoutubeOnClick;
  final String initialVideoId;

  const YoutubePlayerWidget({
    Key? key,
    required this.playOnYoutubeOnClick,
    required this.initialVideoId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: YoutubePlayerController(
        initialVideoId: initialVideoId,
        flags: const YoutubePlayerFlags(
          mute: false,
          autoPlay: false,
          disableDragSeek: false,
          loop: false,
          isLive: false,
          forceHD: false,
          enableCaption: true,
        ),
      ),
      showVideoProgressIndicator: true,
      progressColors: const ProgressBarColors(
        playedColor: Colors.amber,
        handleColor: Colors.amberAccent,
      ),
      topActions: [
        TextButton.icon(
          onPressed: () => playOnYoutubeOnClick(),
          icon: const FaIcon(
            FontAwesomeIcons.youtube,
            color: Color(0xFFFF0000),
          ),
          label: const Text('Play on Youtube'),
        )
      ],
      bottomActions: [
        CurrentPosition(),
        ProgressBar(isExpanded: true),
        RemainingDuration(),
      ],
    );
  }
}
