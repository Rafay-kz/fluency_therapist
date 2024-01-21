import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoWidget extends StatefulWidget {
  final String videoUrl;
  final bool unlocked;
  final bool isPlaying;
  final VoidCallback? onVideoComplete; // Add this line

  const VideoWidget({
    required this.videoUrl,
    this.unlocked = false,
    this.isPlaying = false,
    this.onVideoComplete, // Add this line
    Key? key,
  }) : super(key: key);

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: widget.unlocked &&
          widget.isPlaying, // Auto play if unlocked and isPlaying
      looping: false,
      aspectRatio: 16 / 9, // Adjust as needed
      allowFullScreen: true,
      showControls: true,
      // You can customize other options as needed
    );

    _videoPlayerController.addListener(() {
      if (_videoPlayerController.value.position >=
          _videoPlayerController.value.duration) {
        if (widget.onVideoComplete != null) {
          widget.onVideoComplete!();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.unlocked) {
          _togglePlay();
        }
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Chewie(
              controller: _chewieController,
            ),
          ),
          if (!widget.unlocked && !widget.isPlaying )
            Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(
                child: Icon(
                  Icons.lock,
                  size: 64,
                  color: Colors.white,
                ),
              ),
            ),
          if (_videoPlayerController.value.isBuffering)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }

  void _togglePlay() {
    setState(() {
      if (_videoPlayerController.value.isPlaying) {
        _videoPlayerController.pause();
      } else {
        _videoPlayerController.play();
      }
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}
