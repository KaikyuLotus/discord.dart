library entities;

class EmbedAuthor {
  final String? name;
  final String? url;
  final String? iconUrl;
  final String? proxyIconUrl;

  EmbedAuthor({
    this.name,
    this.url,
    this.iconUrl,
    this.proxyIconUrl,
  });

  static EmbedAuthor fromJson(Map<String, dynamic> json) {
    return EmbedAuthor(
      name: json['name'],
      url: json['url'],
      iconUrl: json['icon_url'],
      proxyIconUrl: json['proxy_icon_url'],
    );
  }

  Map toJson() {
    return {
      'name': name,
      'url': url,
      'icon_url': iconUrl,
      'proxy_icon_url': proxyIconUrl,
    };
  }
}
