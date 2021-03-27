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

class EmbedType extends _Enum<String> {
  static const EmbedType rich = EmbedType._('rich');
  static const EmbedType image = EmbedType._('image');
  static const EmbedType video = EmbedType._('video');
  static const EmbedType gifv = EmbedType._('gifv');
  static const EmbedType article = EmbedType._('article');
  static const EmbedType link = EmbedType._('link');

  static const values = {
    'rich': rich,
    'image': image,
    'video': video,
    'gifv': gifv,
    'article': article,
    'link': link,
  };

  const EmbedType._(String value) : super(value);

  static EmbedType forValue(String value) => EmbedType.values[value]!;
}

class ApplicationCommandOptionType extends _Enum<int> {
  static const ApplicationCommandOptionType subCommand =
      ApplicationCommandOptionType._(1);
  static const ApplicationCommandOptionType subCommandGroup =
      ApplicationCommandOptionType._(2);
  static const ApplicationCommandOptionType string =
      ApplicationCommandOptionType._(3);
  static const ApplicationCommandOptionType integer =
      ApplicationCommandOptionType._(4);
  static const ApplicationCommandOptionType boolean =
      ApplicationCommandOptionType._(5);
  static const ApplicationCommandOptionType user =
      ApplicationCommandOptionType._(6);
  static const ApplicationCommandOptionType channel =
      ApplicationCommandOptionType._(7);
  static const ApplicationCommandOptionType role =
      ApplicationCommandOptionType._(8);

  static const values = {
    1: subCommand,
    2: subCommandGroup,
    3: string,
    4: integer,
    5: boolean,
    6: user,
    7: channel,
    8: role,
  };

  const ApplicationCommandOptionType._(int value) : super(value);

  static ApplicationCommandOptionType forValue(int value) =>
      ApplicationCommandOptionType.values[value]!;
}

class InteractionType extends _Enum<int> {
  static const InteractionType ping = InteractionType._(1);
  static const InteractionType applicationCommand = InteractionType._(2);

  static const values = {
    1: ping,
    2: applicationCommand,
  };

  const InteractionType._(int value) : super(value);

  static InteractionType forValue(int value) => InteractionType.values[value]!;
}

class InteractionResponseType extends _Enum<int> {
  static const InteractionResponseType pong = InteractionResponseType._(1);
  static const InteractionResponseType acknowledge =
      InteractionResponseType._(2);
  static const InteractionResponseType channelMessage =
      InteractionResponseType._(3);
  static const InteractionResponseType channelMessageWithSource =
      InteractionResponseType._(4);
  static const InteractionResponseType deferredChannelMessageWithSource =
      InteractionResponseType._(5);

  static const values = {
    1: pong,
    2: acknowledge,
    3: channelMessage,
    4: channelMessageWithSource,
    5: deferredChannelMessageWithSource,
  };

  const InteractionResponseType._(int value) : super(value);

  static InteractionResponseType forValue(int value) =>
      InteractionResponseType.values[value]!;
}

class AllowedMentionsType extends _Enum<String> {
  static const AllowedMentionsType roleMentions =
      AllowedMentionsType._('roles');
  static const AllowedMentionsType userMentions =
      AllowedMentionsType._('users');
  static const AllowedMentionsType everyoneMentions =
      AllowedMentionsType._('everyone');

  static const values = {
    'roles': roleMentions,
    'users': userMentions,
    'everyone': everyoneMentions,
  };

  const AllowedMentionsType._(String value) : super(value);

  static AllowedMentionsType forValue(String value) =>
      AllowedMentionsType.values[value]!;
}

class GuildFeature extends _Enum<String> {
  static const GuildFeature inviteSplash = GuildFeature._('INVITE_SPLASH');
  static const GuildFeature vipRegions = GuildFeature._('VIP_REGIONS');
  static const GuildFeature vanityUrl = GuildFeature._('VANITY_URL');
  static const GuildFeature verified = GuildFeature._('VERIFIED');
  static const GuildFeature partnered = GuildFeature._('PARTNERED');
  static const GuildFeature community = GuildFeature._('COMMUNITY');
  static const GuildFeature commerce = GuildFeature._('COMMERCE');
  static const GuildFeature news = GuildFeature._('NEWS');
  static const GuildFeature discoverable = GuildFeature._('DISCOVERABLE');
  static const GuildFeature featurable = GuildFeature._('FEATURABLE');
  static const GuildFeature animatedIcon = GuildFeature._('ANIMATED_ICON');
  static const GuildFeature banner = GuildFeature._('BANNER');
  static const GuildFeature welcomeScreenEnabled =
      GuildFeature._('WELCOME_SCREEN_ENABLED');
  static const GuildFeature memberVerificationGateEnabled =
      GuildFeature._('MEMBER_VERIFICATION_GATE_ENABLED');
  static const GuildFeature previewEnabled = GuildFeature._('PREVIEW_ENABLED');

  static const values = {
    'INVITE_SPLASH': inviteSplash,
    'VIP_REGIONS': vipRegions,
    'VANITY_URL': vanityUrl,
    'VERIFIED': verified,
    'PARTNERED': partnered,
    'COMMUNITY': community,
    'COMMERCE': commerce,
    'NEWS': news,
    'DISCOVERABLE': discoverable,
    'FEATURABLE': featurable,
    'ANIMATED_ICON': animatedIcon,
    'BANNER': banner,
    'WELCOME_SCREEN_ENABLED': welcomeScreenEnabled,
    'MEMBER_VERIFICATION_GATE_ENABLED': memberVerificationGateEnabled,
    'PREVIEW_ENABLED': previewEnabled,
  };

  const GuildFeature._(String value) : super(value);

  static GuildFeature forValue(String value) => GuildFeature.values[value]!;
}

class TargetUserType extends _Enum<int> {
  static const TargetUserType stream = TargetUserType._(1);

  static const values = {1: stream};

  const TargetUserType._(int value) : super(value);

  static TargetUserType forValue(int value) => TargetUserType.values[value]!;
}

class ChannelType extends _Enum<int> {
  static const ChannelType guildText = ChannelType._(0);
  static const ChannelType dm = ChannelType._(1);
  static const ChannelType guildVoice = ChannelType._(2);
  static const ChannelType groupDM = ChannelType._(3);
  static const ChannelType guildCategory = ChannelType._(4);
  static const ChannelType guildNews = ChannelType._(5);
  static const ChannelType guildStore = ChannelType._(6);

  static const values = {
    0: guildText,
    1: dm,
    2: guildVoice,
    3: groupDM,
    4: guildCategory,
    5: guildNews,
    6: guildStore,
  };

  const ChannelType._(int value) : super(value);

  static ChannelType forValue(int value) => ChannelType.values[value]!;
}

class MessageActivityType extends _Enum<int> {
  static const MessageActivityType join = MessageActivityType._(1);
  static const MessageActivityType spectate = MessageActivityType._(2);
  static const MessageActivityType listen = MessageActivityType._(3);
  static const MessageActivityType joinRequest = MessageActivityType._(4);

  static const values = {
    1: join,
    2: spectate,
    3: listen,
    4: joinRequest,
  };

  const MessageActivityType._(int value) : super(value);

  static MessageActivityType forValue(int value) =>
      MessageActivityType.values[value]!;
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
