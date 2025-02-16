import 'package:flutter/material.dart';


class OptimizedImageLoader extends StatelessWidget {
  
  final String imagePath;
  final BoxFit fit;
  final double? width;
  final double? height;

  const OptimizedImageLoader({
    super.key,
    required this.imagePath,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      cacheWidth: (width ?? MediaQuery.of(context).size.width).round() * 2,
      cacheHeight: (height ?? MediaQuery.of(context).size.height).round() * 2,
      fit: fit,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded) return child;
        return AnimatedOpacity(
          opacity: frame == null ? 0 : 1,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOut,
          child: child,
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: Colors.grey[200],
          child: const Center(
            child: Icon(
              Icons.error_outline,
              color: Colors.grey,
              size: 40,
            ),
          ),
        );
      },
    );
  }
}