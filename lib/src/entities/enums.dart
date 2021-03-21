library entities;

class _Enum<T> {
  final T _value;

  T get value => _value;

  const _Enum(this._value);

  @override
  String toString() => '$_value';

  String toJson() => '$this';
}

class UserStatus extends _Enum<String> {
  static const UserStatus online = UserStatus._('online');
  static const UserStatus dnd = UserStatus._('dnd');
  static const UserStatus idle = UserStatus._('idle');
  static const UserStatus invisible = UserStatus._('invisible');
  static const UserStatus offline = UserStatus._('offline');

  static const values = {
    'online': online,
    'dnd': dnd,
    'idle': idle,
    'invisible': invisible,
    'offline': offline,
  };

  const UserStatus._(String value) : super(value);

  static UserStatus forValue(String value) => UserStatus.values[value]!;
}

class UserActivityType extends _Enum<int> {
  static const UserActivityType game = UserActivityType._(0);
  static const UserActivityType streaming = UserActivityType._(1);
  static const UserActivityType listening = UserActivityType._(2);
  static const UserActivityType custom = UserActivityType._(3);
  static const UserActivityType competing = UserActivityType._(4);

  static const values = {
    'game': game,
    'streaming': streaming,
    'listening': listening,
    'custom': custom,
    'competing': competing,
  };

  const UserActivityType._(int value) : super(value);

  static UserActivityType forValue(int value) =>
      UserActivityType.values[value]!;
}

class Intent extends _Enum<int> {
  static List<Intent> get none => const [];

  static List<Intent> get all => values.values.toList();

  static const values = {
    0: guilds,
    1: guildMembers,
    2: guildBans,
    3: guildEmojis,
    4: guildIntegrations,
    5: guildWebhooks,
    6: guildInvites,
    7: guildVoiceStates,
    8: guildPresences,
    9: guildMessages,
    10: guildMessageReaction,
    11: guildMessageTyping,
    12: directMessages,
    13: directMessagesReactions,
    14: directMessagesTyping,
  };

  static const Intent guilds = Intent._(0);
  static const Intent guildMembers = Intent._(1);
  static const Intent guildBans = Intent._(2);
  static const Intent guildEmojis = Intent._(3);
  static const Intent guildIntegrations = Intent._(4);
  static const Intent guildWebhooks = Intent._(5);
  static const Intent guildInvites = Intent._(6);
  static const Intent guildVoiceStates = Intent._(7);
  static const Intent guildPresences = Intent._(8);
  static const Intent guildMessages = Intent._(9);
  static const Intent guildMessageReaction = Intent._(10);
  static const Intent guildMessageTyping = Intent._(11);
  static const Intent directMessages = Intent._(12);
  static const Intent directMessagesReactions = Intent._(13);
  static const Intent directMessagesTyping = Intent._(14);

  const Intent._(int value) : super(value);

  static Intent forValue(int value) => Intent.values[value]!;
}
