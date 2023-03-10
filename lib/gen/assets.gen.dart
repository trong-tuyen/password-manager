/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/basecamp.png
  AssetGenImage get basecamp =>
      const AssetGenImage('assets/images/basecamp.png');

  /// File path: assets/images/facebook_card.png
  AssetGenImage get facebookCard =>
      const AssetGenImage('assets/images/facebook_card.png');

  /// File path: assets/images/facebook_login.png
  AssetGenImage get facebookLogin =>
      const AssetGenImage('assets/images/facebook_login.png');

  /// File path: assets/images/fill.png
  AssetGenImage get fill => const AssetGenImage('assets/images/fill.png');

  /// File path: assets/images/filter.png
  AssetGenImage get filter => const AssetGenImage('assets/images/filter.png');

  /// File path: assets/images/gmail_card.png
  AssetGenImage get gmailCard =>
      const AssetGenImage('assets/images/gmail_card.png');

  /// File path: assets/images/gmail_login.png
  AssetGenImage get gmailLogin =>
      const AssetGenImage('assets/images/gmail_login.png');

  /// File path: assets/images/mask.png
  AssetGenImage get mask => const AssetGenImage('assets/images/mask.png');

  /// File path: assets/images/media.png
  AssetGenImage get media => const AssetGenImage('assets/images/media.png');

  /// File path: assets/images/paypal.png
  AssetGenImage get paypal => const AssetGenImage('assets/images/paypal.png');

  /// File path: assets/images/quora.png
  AssetGenImage get quora => const AssetGenImage('assets/images/quora.png');

  /// File path: assets/images/shield.png
  AssetGenImage get shield => const AssetGenImage('assets/images/shield.png');

  /// File path: assets/images/start.png
  AssetGenImage get start => const AssetGenImage('assets/images/start.png');

  /// File path: assets/images/twitter.png
  AssetGenImage get twitter => const AssetGenImage('assets/images/twitter.png');

  /// File path: assets/images/upwork.png
  AssetGenImage get upwork => const AssetGenImage('assets/images/upwork.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        basecamp,
        facebookCard,
        facebookLogin,
        fill,
        filter,
        gmailCard,
        gmailLogin,
        mask,
        media,
        paypal,
        quora,
        shield,
        start,
        twitter,
        upwork
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}
