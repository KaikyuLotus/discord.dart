class User {
  final String id;
  final String username;
  final String discriminator;
  final String? avatar;
  final bool? bot;
  final bool? system;
  final bool? mfaEnabled;
  final String? locale;
  final bool? verified;
  final String? email;
  final int? flags;
  final int? premiumType;
  final int? publicFlags;

  User({
    required this.id,
    required this.username,
    required this.discriminator,
    this.avatar,
    this.bot,
    this.system,
    this.mfaEnabled,
    this.locale,
    this.verified,
    this.email,
    this.flags,
    this.premiumType,
    this.publicFlags,
  });

  static User fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id']!,
      username: json['username']!,
      discriminator: json['discriminator']!,
      avatar: json['avatar'],
      bot: json['bot'],
      system: json['system'],
      mfaEnabled: json['mfa_enabled'],
      locale: json['locale'],
      verified: json['verified'],
      email: json['email'],
      flags: json['flags'],
      premiumType: json['premium_type'],
      publicFlags: json['public_flags'],
    );
  }

  Map toJson() {
    return {
      'id': id,
      'username': username,
      'discriminator': discriminator,
      'avatar': avatar,
      'bot': bot,
      'system': system,
      'mfa_enabled': mfaEnabled,
      'locale': locale,
      'verified': verified,
      'email': email,
      'flags': flags,
      'premium_type': premiumType,
      'public_flags': publicFlags,
    };
  }
}
