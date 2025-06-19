import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tools2/constants/colour_scheme.dart';
import 'package:tools2/constants/screen_counts.dart';
import 'package:tools2/test.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = Test();

  Future<bool> manualRequestPermission() async {
    PermissionStatus manageExternalStorageStatus =
        await Permission.manageExternalStorage.status;

    if (manageExternalStorageStatus.isPermanentlyDenied) {
      await openAppSettings();
      manageExternalStorageStatus =
          await Permission.manageExternalStorage.status;
      if (manageExternalStorageStatus.isGranted) {
        return true;
      }
    } else {
      //? Request permissions once again
      final requestPermission = await Permission.manageExternalStorage
          .request();

      if (requestPermission.isGranted) {
        await Permission.notification.request();
        return true;
      } else {
        return false;
      }
    }
    return false;
  }

  // void _incrementCounter() async {
  //   final manifest = await controller.getVideoInfo();
  //   showBottomSheet(manifest);
  // }

  void showBottomSheet(StreamManifest manifest) {
    final List<VideoOnlyStreamInfo> allVideos = manifest.videoOnly
        .where((video) => video.container == StreamContainer.mp4)
        .toList();

    // Use a Map to store the best video for each qualityLabel
    final Map<String, VideoOnlyStreamInfo> bestVideosByQuality = {};

    for (var video in allVideos) {
      final quality = video.qualityLabel;
      if (bestVideosByQuality.containsKey(quality)) {
        // If a video with this quality already exists, compare sizes
        final existingVideo = bestVideosByQuality[quality]!;
        if (video.size.totalMegaBytes > existingVideo.size.totalMegaBytes) {
          // If the current video is larger, replace the existing one
          bestVideosByQuality[quality] = video;
        }
      } else {
        // If this quality is new, add it to the map
        bestVideosByQuality[quality] = video;
      }
    }

    // Convert the map values back to a list
    final List<VideoOnlyStreamInfo> filteredVideos = bestVideosByQuality.values
        .toList();

    // Optional: Sort the videos by qualityLabel for better presentation
    filteredVideos.sort((a, b) => b.qualityLabel.compareTo(a.qualityLabel));

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsetsGeometry.all(5),
          child: ListView.builder(
            itemCount: filteredVideos.length,
            itemBuilder: (context, index) {
              final video = filteredVideos[index];
              return ListTile(
                onTap: () async {
                  final gotPermission = await manualRequestPermission();

                  if (gotPermission) {
                    await controller.onDownloadClick(video);
                    Navigator.pop(context);
                  }
                },
                leading: Text((index + 1).toString()),
                title: Text(video.qualityLabel),
                subtitle: Text(video.size.toString()),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tools By Rahul")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: GridView.count(
            crossAxisCount: 4,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: screens
                .map(
                  (e) => InkWell(
                    onTap: () => e.onPress(),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade600),
                        color: secondaryBackgroundColor,
                      ),
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            e.icon != null
                                ? Icon(
                                    e.icon,
                                    size: 38,
                                    color: Colors.grey.shade400,
                                  )
                                : Image.asset(e.imagePath!, width: 38),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
