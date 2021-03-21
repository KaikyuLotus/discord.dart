library entities;

import '../../../entities.dart';
import '../../internal.dart';

class Embed {
  final String? title;

  // rich, image, video, gifv, article, link
  // TODO enum from https://discord.com/developers/docs/resources/channel#embed-object-embed-types
  final String? type;
  final String? description;
  final String? url;
  final String? timestamp; // TODO ISO timestamp
  final int? color;
  final EmbedFooter? footer;
  final EmbedImage? image;
  final EmbedThumbnail? thumbnail;
  final EmbedVideo? video;
  final EmbedProvider? provider;
  final EmbedAuthor? author;
  final List<EmbedField>? fields;

  Embed({
    this.title,
    this.type,
    this.description,
    this.url,
    this.timestamp,
    this.color,
    this.footer,
    this.image,
    this.thumbnail,
    this.video,
    this.provider,
    this.author,
    this.fields,
  });

  static Embed fromJson(Map<String, dynamic> json) {
    return Embed(
      title: json['title'],
      type: json['type'],
      description: json['description'],
      url: json['url'],
      timestamp: json['timestamp'],
      color: json['color'],
      footer: ifNotNull(EmbedFooter.fromJson, json['footer']),
      image: ifNotNull(EmbedImage.fromJson, json['image']),
      thumbnail: ifNotNull(EmbedThumbnail.fromJson, json['thumbnail']),
      video: ifNotNull(EmbedVideo.fromJson, json['video']),
      provider: ifNotNull(EmbedProvider.fromJson, json['provider']),
      author: ifNotNull(EmbedAuthor.fromJson, json['author']),
      fields: fromArray(EmbedField.fromJson, json['fields']),
    );
  }

  Map toJson() {
    return {
      'title': title,
      'type': type,
      'description': description,
      'url': url,
      'timestamp': timestamp,
      'color': color,
      'footer': footer,
      'image': image,
      'thumbnail': thumbnail,
      'video': video,
      'provider': provider,
      'author': author,
      'fields': fields,
    };
  }
}
