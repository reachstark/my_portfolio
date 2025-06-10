import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

void showZoomableImageDialog(BuildContext context, String imageUrl) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (_) => Dialog.fullscreen(
      backgroundColor: Colors.black,
      child: Stack(
        children: [
          InteractiveViewer(
            panEnabled: true,
            minScale: 1,
            maxScale: 5,
            child: Center(
              child: CachedNetworkImage(
                fit: BoxFit.contain,
                imageUrl: imageUrl,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                      child: CircularProgressIndicator(
                        value: downloadProgress.progress,
                      ),
                    ),
              ),
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 30),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      ),
    ),
  );
}
