library entities;

class EmbedThumbnail {
  final String? url;
  final String? proxyUrl;
  final int? height;
  final int? width;

  EmbedThumbnail({
    this.url,
    this.proxyUrl,
    this.height,
    this.width,
  });

  static EmbedThumbnail fromJson(Map<String, dynamic> json) {
    return EmbedThumbnail(
      url: json['url'],
      proxyUrl: json['proxy_url'],
      height: json['height'],
      width: json['width'],
    );
  }

  Map toJson() {
    return {
      'url': url,
      'proxy_url': proxyUrl,
      'height': height,
      'width': width,
    };
  }
}
