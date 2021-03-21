library entities;

class EmbedVideo {
  final String? url;
  final String? proxyUrl;
  final int? height;
  final int? width;

  EmbedVideo({
    this.url,
    this.proxyUrl,
    this.height,
    this.width,
  });

  static EmbedVideo fromJson(Map<String, dynamic> json) {
    return EmbedVideo(
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
