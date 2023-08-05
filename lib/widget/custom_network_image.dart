import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fire_boot/constant/app_values.dart';
import 'custom_network_image_placeholder.dart';

class CustomNetWorkImage extends StatelessWidget {
  final double? width;
  final double? height;
  final double? radius;
  final BoxFit? fit;
  final String imageUrl;
  final BoxBorder? border;
  final Widget? placeholder;
  final Widget? errorWidget;

  const CustomNetWorkImage({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
    this.radius = AppValues.defaultRadius,
    this.fit = BoxFit.cover,
    this.border,
    this.placeholder,
    this.errorWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final borderRadius =
        radius != null ? BorderRadius.all(Radius.circular(radius!)) : null;
    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(radius!)),
          border: border,
          image: DecorationImage(
            image: imageProvider,
            fit: fit,
          ),
        ),
      ),
      placeholder: (context, url) =>
          placeholder ??
          CustomNetWorkImagePlaceholder(
            placeholderType: NetWorkImagePlaceholderType.loading,
            borderRadius: borderRadius,
            border: border,
          ),
      errorWidget: (context, url, error) =>
          errorWidget ??
          CustomNetWorkImagePlaceholder(
            placeholderType: NetWorkImagePlaceholderType.error,
            borderRadius: borderRadius,
            border: border,
          ),
    );
  }
}
