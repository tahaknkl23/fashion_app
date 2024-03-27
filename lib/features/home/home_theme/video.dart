import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MyVideoPlayer extends StatefulWidget {
  const MyVideoPlayer({super.key});

  @override
  _MyVideoPlayerState createState() => _MyVideoPlayerState();
}

class _MyVideoPlayerState extends State<MyVideoPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Video dosyasının yolunu belirleyin
    String videoPath = 'assets/video/video.mp4';
    // VideoPlayerController oluşturun ve video dosyasını yükleyin
    _controller = VideoPlayerController.asset(videoPath)
      ..initialize().then((_) {
        // Video başarıyla yüklendikten sonra oynatmayı başlatın
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20), // İsteğe bağlı: Container'ın kenar boşluğunu belirleyin
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black), // İsteğe bağlı: Container'a bir kenarlık ekleyin
      ),
      child: AspectRatio(
        aspectRatio: 16 / 9, // Video oranını belirleyin
        child: _controller.value.isInitialized
            ? VideoPlayer(_controller) // Video oynatıcısını oluşturun
            : const Center(child: CircularProgressIndicator()), // Video yüklenene kadar bir yüklenme çemberi gösterin
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    // VideoPlayerController'ı temizleyin
    _controller.dispose();
  }
}
