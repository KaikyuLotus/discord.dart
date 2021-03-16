class Sticker {
  final String id;
  final String packId;
  final String name;
  final String description;
  final String? tags;
  final String asset;
  final String? previewAsset;

  // TODO enum from https://discord.com/developers/docs/resources/channel#message-object-message-sticker-format-types
  final int formatType;

  Sticker({
    required this.id,
    required this.packId,
    required this.name,
    required this.description,
    this.tags,
    required this.asset,
    this.previewAsset,
    required this.formatType,
  });

  static Sticker fromJson(Map<String, dynamic> json) {
    return Sticker(
      id: json['id'],
      packId: json['pack_id'],
      name: json['name'],
      description: json['description'],
      tags: json['tags'],
      asset: json['asset'],
      previewAsset: json['preview_asset'],
      formatType: json['format_type'],
    );
  }

  Map toJson() {
    return {
      'id': id,
      'pack_id': packId,
      'name': name,
      'description': description,
      'tags': tags,
      'asset': asset,
      'preview_asset': previewAsset,
      'format_type': formatType,
    };
  }
}
