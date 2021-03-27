library entities;

class EmbedField {
  final String name;
  final String? url;
  final bool? inline;

  EmbedField({
    required this.name,
    this.url,
    this.inline,
  });

  static EmbedField fromJson(Map<String, dynamic> json) {
    return EmbedField(
      name: json['name'],
      url: json['url'],
      inline: json['icon_url'],
    );
  }

  Map toJson() {
    return {
      'name': name,
      'url': url,
      'inline': inline,
    };
  }
}
