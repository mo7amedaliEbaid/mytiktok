import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerItem extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerItem({
    Key? key,
    required this.videoUrl,
  }) : super(key: key);

  @override
  _VideoPlayerItemState createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    super.initState();
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
          ..initialize().then((value) {
            setState(() {
              videoPlayerController.play();
              videoPlayerController.setVolume(1);
              videoPlayerController.setLooping(true);
            });

          });
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return SizedBox.expand(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Container(
          width: videoPlayerController.value.size.width,
          height: videoPlayerController.value.size.height,
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: VideoPlayer(videoPlayerController),
        ),
      ),
    );
  }
}
