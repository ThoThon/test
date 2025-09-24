import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:v_bhxh/clean/core/data/data_source/local/app_hive_impl.dart';
import 'package:v_bhxh/core/values/hive_key.dart';

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage({
    super.key,
    required this.url,
    this.fit,
    this.width,
    this.height,
  });

  final String url;
  final BoxFit? fit;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final accessToken = AppHiveImpl.instance.get<String>(HiveKeys.keyJwtToken);
    return Image.network(
      url,
      width: width,
      height: height,
      fit: fit,
      headers: {
        if (accessToken != null) 'Authorization': 'Bearer $accessToken',
      },
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return SizedBox(
          width: width,
          height: height,
          child: const Center(
            child: CupertinoActivityIndicator(),
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return SizedBox(
          width: width,
          height: height,
          child: const Center(
            child: Icon(
              Icons.broken_image,
              color: Colors.grey,
            ),
          ),
        );
      },
    );
  }
}
