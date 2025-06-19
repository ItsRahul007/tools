import 'dart:io';

import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class Test {
  static const String videoId = "5sciNKmHH-U";
  final yt = YoutubeExplode();
  String? videoName;

  Future<StreamManifest> getVideoInfo() async {
    final video = await yt.videos.get(videoId);

    videoName = video.title;
    final author = video.author;
    final duration = video.duration;

    print(
      "video info - title: $videoName, author: $author, duration: $duration",
    );

    final StreamManifest manifest = await yt.videos.streams.getManifest(
      videoId,
    );

    return manifest;
  }

  Future<void> onDownloadClick(StreamInfo streamInfo) async {
    // Open a file for writing.
    var file = File("/storage/emulated/0/Download/$videoName.mp4");
    var fileStream = file.openWrite();

    // Get the actual byte stream
    var stream = yt.videos.streams.get(streamInfo);

    // Pipe all the content of the stream into the file.
    await stream.pipe(fileStream);

    // Close the file.
    await fileStream.flush();
    await fileStream.close();
  }
}
