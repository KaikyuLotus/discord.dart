library entities;

class ActivityAssets {
  final String? largeImage;
  final String? largeText;
  final String? smallImage;
  final String? smallText;

  ActivityAssets({
    this.largeImage,
    this.largeText,
    this.smallImage,
    this.smallText,
  });

  static ActivityAssets fromJson(Map<String, dynamic> json) {
    return ActivityAssets(
      largeImage: json['largeImage'],
      largeText: json['largeText'],
      smallImage: json['smallImage'],
      smallText: json['smallText'],
    );
  }

  Map toJson() {
    return {
      'large_image': largeImage,
      'large_text': largeText,
      'small_image': smallImage,
      'small_text': smallText,
    };
  }
}
