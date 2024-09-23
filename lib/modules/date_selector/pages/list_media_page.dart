import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class ListMediaPage extends StatefulWidget {
  final DateTime date;
  const ListMediaPage({
    super.key,
    required this.date,
  });

  @override
  State<ListMediaPage> createState() => _ListMediaPageState();
}

class _ListMediaPageState extends State<ListMediaPage> {
  List<AssetEntity> mediaList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _requestPermissionAndFetchMedia();
  }

  Future<void> _requestPermissionAndFetchMedia() async {
    await _fetchMedia();
  }

  Future<void> _fetchMedia() async {
    // Obtener todas las galerías
    List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
      type: RequestType.all,
      hasAll: true,
    );

    if (albums.isNotEmpty) {
      // Obtener los medios de la primera galería (puedes elegir otra según necesidad)
      List<AssetEntity> assets =
          await albums[0].getAssetListPaged(page: 0, size: 1000);
      setState(() {
        mediaList = assets;
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  Widget _buildGridItem(AssetEntity asset) {
    return FutureBuilder<Widget>(
      future: _buildThumbnail(asset),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return GestureDetector(
            onTap: () => _onAssetTap(asset),
            child: Stack(
              children: [
                Positioned.fill(child: snapshot.data!),
                if (asset.type == AssetType.video)
                  const Positioned(
                    right: 5,
                    bottom: 5,
                    child: Icon(
                      Icons.videocam,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                if (asset.type == AssetType.image)
                  const Positioned(
                    right: 5,
                    bottom: 5,
                    child: Icon(
                      Icons.camera,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
              ],
            ),
          );
        }
        return Container(
          color: Colors.grey[300],
        );
      },
    );
  }

  Future<Widget> _buildThumbnail(AssetEntity asset) async {
    // Obtener el thumbnail
    final thumbData =
        await asset.thumbnailDataWithSize(const ThumbnailSize(200, 200));
    if (thumbData != null) {
      return Image.memory(
        thumbData,
        fit: BoxFit.cover,
      );
    } else {
      return Container(color: Colors.grey);
    }
  }

  void _onAssetTap(AssetEntity asset) {
    if (asset.type == AssetType.image) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ImageViewPage(asset: asset),
        ),
      );
    } else if (asset.type == AssetType.video) {
      print('Video');
      // Navigator.push(
      //   // context,
      //   // MaterialPageRoute(
      //   //   builder: (_) => VideoViewPage(asset: asset),
      //   // ),
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galería'),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : mediaList.isEmpty
              ? const Center(
                  child: Text('No se encontraron fotos o videos.'),
                )
              : GridView.builder(
                  padding: const EdgeInsets.all(4),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4),
                  itemCount: mediaList.length,
                  itemBuilder: (context, index) {
                    return _buildGridItem(mediaList[index]);
                  },
                ),
    );
  }
}

class ImageViewPage extends StatelessWidget {
  final AssetEntity asset;

  const ImageViewPage({super.key, required this.asset});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image'),
      ),
      body: FutureBuilder<Widget>(
        future: _loadFullImage(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return Center(child: snapshot.data);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Future<Widget> _loadFullImage() async {
    final imageData = await asset.originBytes;
    if (imageData != null) {
      return Image.memory(imageData);
    } else {
      return Container(color: Colors.grey);
    }
  }
}
