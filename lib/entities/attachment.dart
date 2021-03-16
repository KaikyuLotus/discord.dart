class Attachment {
  final String id;
  final String filename;
  final int size;
  final String url;
  final String proxyUrl;
  final int? height;
  final int? width;

  Attachment({
    required this.id,
    required this.filename,
    required this.size,
    required this.url,
    required this.proxyUrl,
    this.height,
    this.width,
  });

  static Attachment fromJson(Map<String, dynamic> json) {
    return Attachment(
      id: json['id'],
      filename: json['filename'],
      size: json['size'],
      url: json['url'],
      proxyUrl: json['proxy_url'],
      height: json['height'],
      width: json['width'],
    );
  }

  Map toJson() {
    return {
      'id': id,
      'filename': filename,
      'size': size,
      'url': url,
      'proxy_url': proxyUrl,
      'height': height,
      'width': width,
    };
  }
}
