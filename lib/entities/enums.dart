class UserStatus {
  final String _status;

  static final UserStatus online = UserStatus._('online');
  static final UserStatus dnd = UserStatus._('dnd');
  static final UserStatus idle = UserStatus._('idle');
  static final UserStatus invisible = UserStatus._('invisible');
  static final UserStatus offline = UserStatus._('offline');

  UserStatus._(this._status);

  UserStatus fromString(String status) {
    return UserStatus._(status);
  }

  @override
  String toString() {
    return _status;
  }

  String toJson() {
    return '$this';
  }
}

class UserActivityType {
  final int _type;

  static final UserActivityType game = UserActivityType._(0);
  static final UserActivityType streaming = UserActivityType._(1);
  static final UserActivityType listening = UserActivityType._(2);
  static final UserActivityType custom = UserActivityType._(3);
  static final UserActivityType competing = UserActivityType._(4);

  UserActivityType._(this._type);

  UserActivityType fromInt(int type) {
    return UserActivityType._(type);
  }

  @override
  String toString() {
    return '$_type';
  }

  String toJson() {
    return '$this';
  }
}

class Intent {
  final int value;

  static List<Intent> get none => [];

  static List<Intent> get all {
    return [
      guilds,
      guildMembers,
      guildBans,
      guildEmojis,
      guildIntegrations,
      guildWebhooks,
      guildInvites,
      guildVoiceStates,
      guildPresences,
      guildMessages,
      guildMessageReaction,
      guildMessageTyping,
      directMessages,
      directMessagesReactions,
      directMessagesTyping,
    ];
  }

  static final Intent guilds = Intent._(0);
  static final Intent guildMembers = Intent._(1);
  static final Intent guildBans = Intent._(2);
  static final Intent guildEmojis = Intent._(3);
  static final Intent guildIntegrations = Intent._(4);
  static final Intent guildWebhooks = Intent._(5);
  static final Intent guildInvites = Intent._(6);
  static final Intent guildVoiceStates = Intent._(7);
  static final Intent guildPresences = Intent._(8);
  static final Intent guildMessages = Intent._(9);
  static final Intent guildMessageReaction = Intent._(10);
  static final Intent guildMessageTyping = Intent._(11);
  static final Intent directMessages = Intent._(12);
  static final Intent directMessagesReactions = Intent._(13);
  static final Intent directMessagesTyping = Intent._(14);

  Intent._(this.value);

  Intent fromInt(int value) {
    return Intent._(value);
  }

  @override
  String toString() {
    return '$value';
  }

  String toJson() {
    return '$this';
  }
}
