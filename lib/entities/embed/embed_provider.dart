class EmbedProvider {
  final String? name;
  final String? url;

  EmbedProvider({
    this.name,
    this.url,
  });

  static EmbedProvider fromJson(Map<String, dynamic> json) {
    return EmbedProvider(
      name: json['name'],
      url: json['url'],
    );
  }

  Map toJson() {
    return {
      'name': name,
      'url': url,
    };
  }
}
