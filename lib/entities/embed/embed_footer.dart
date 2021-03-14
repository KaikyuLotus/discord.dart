class EmbedFooter {
  final String text;
  final String? iconUrl;
  final String? proxyIconUrl;

  EmbedFooter({
    required this.text,
    this.iconUrl,
    this.proxyIconUrl,
  });

  static EmbedFooter fromJson(Map<String, dynamic> json) {
    return EmbedFooter(
      text: json['text']!,
      iconUrl: json['icon_url'],
      proxyIconUrl: json['proxy_icon_url'],
    );
  }

  Map toJson() {
    return {
      'text': text,
      'icon_url': iconUrl,
      'proxy_icon_url': proxyIconUrl,
    };
  }
}
