import '../../discord.dart';
import '../../entities.dart';

class DiscordEvents {
  /// Gets called on any gateway event<br>
  /// Where [type] is a string with the event type and [event] a dictionary
  Future Function(DiscordClient client, String type, dynamic event)? onEvent;

  /// Handles READY gateway events
  Future Function(
    DiscordClient client,
    Ready event,
  )? onReady;

  /// Handles CHANNEL_CREATE gateway events
  Future Function(
    DiscordClient client,
    Channel event,
  )? onChannelCreate;

  /// Handles CHANNEL_UPDATE gateway events
  Future Function(
    DiscordClient client,
    Channel event,
  )? onChannelUpdate;

  /// Handles CHANNEL_DELETE gateway events
  Future Function(
    DiscordClient client,
    Channel event,
  )? onChannelDelete;

  /// Handles ON_CHANNEL_PINS_UPDATE gateway events
  Future Function(
    DiscordClient client,
    ChannelPinsUpdateEvent event,
  )? onChannelPinsUpdate;

  /// Handles GUILD_CREATE gateway events
  Future Function(
    DiscordClient client,
    Guild event,
  )? onGuildCreate;

  Future Function(
    DiscordClient client,
    Guild event,
  )? onGuildUpdate;

  Future Function(
    DiscordClient client,
    Guild event,
  )? onGuildDelete;

  Future Function(
    DiscordClient client,
    GuildBanAddEvent event,
  )? onGuildBanAdd;

  Future Function(
    DiscordClient client,
    GuildBanRemoveEvent event,
  )? onGuildBanRemove;

  Future Function(
    DiscordClient client,
    GuildEmojiUpdateEvent event,
  )? onGuildEmojiUpdate;

  Future Function(
    DiscordClient client,
    GuildIntegrationsUpdateEvent event,
  )? onGuildIntegrationsUpdate;

  Future Function(
    DiscordClient client,
    Member event,
  )? onGuildMemberAdd;

  Future Function(
    DiscordClient client,
    GuildMemberRemoveEvent event,
  )? onGuildMemberRemove;

  Future Function(
    DiscordClient client,
    GuildMemberUpdateEvent event,
  )? onGuildMemberUpdate;

  Future Function(
    DiscordClient client,
    GuildMembersChunkEvent event,
  )? onGuildMembersChunk;

  Future Function(
    DiscordClient client,
    GuildRoleCreateEvent event,
  )? onGuildRoleCreate;

  Future Function(
    DiscordClient client,
    GuildRoleUpdateEvent event,
  )? onGuildRoleUpdate;

  Future Function(
    DiscordClient client,
    GuildRoleDeleteEvent event,
  )? onGuildRoleDelete;

  Future Function(
    DiscordClient client,
    InviteCreateEvent event,
  )? onInviteCreate;

  Future Function(
    DiscordClient client,
    InviteDeleteEvent event,
  )? onInviteDelete;

  /// Handles MESSAGE_CREATE gateway events
  Future Function(
    DiscordClient client,
    Message event,
  )? onMessageCreate;

  Future Function(
    DiscordClient client,
    MessageDeleteEvent event,
  )? onMessageDelete;

  Future Function(
    DiscordClient client,
    MessageDeleteBulkEvent event,
  )? onMessageDeleteBulk;

  Future Function(
    DiscordClient client,
    MessageReactionAddEvent event,
  )? onMessageReactionAdd;

  Future Function(
    DiscordClient client,
    MessageReactionRemoveEvent event,
  )? onMessageReactionRemove;

  Future Function(
    DiscordClient client,
    MessageReactionRemoveAllEvent event,
  )? onMessageReactionRemoveAll;

  Future Function(
    DiscordClient client,
    MessageReactionRemoveEmojiEvent event,
  )? onMessageReactionRemoveEmoji;

  Future Function(
    DiscordClient client,
    PresenceUpdateEvent event,
  )? onPresenceUpdate;

  Future Function(
    DiscordClient client,
    TypingStartEvent event,
  )? onTypingStart;

  Future Function(
    DiscordClient client,
    User event,
  )? onUserUpdate;

  Future Function(
    DiscordClient client,
    VoiceState event,
  )? onVoiceStateUpdate;

  Future Function(
    DiscordClient client,
    VoiceServerUpdateEvent event,
  )? onVoiceServerUpdate;

  Future Function(
    DiscordClient client,
    WebhookUpdateEvent event,
  )? onWebhookUpdate;

  Future Function(
    DiscordClient client,
    ApplicationCommand event,
  )? onApplicationCommandCreate;

  Future Function(
    DiscordClient client,
    ApplicationCommand event,
  )? onApplicationCommandUpdate;

  Future Function(
    DiscordClient client,
    ApplicationCommand event,
  )? onApplicationCommandDelete;

  Future Function(
    DiscordClient client,
    Interaction event,
  )? onInteractionCreate;

  // Event handlers
  late final Map<String, Future? Function(DiscordClient, dynamic)>
      eventHandlers = {
    'CHANNEL_CREATE': (c, d) => onChannelCreate?.call(c, Channel.fromJson(d)),
    'CHANNEL_UPDATE': (c, d) => onChannelUpdate?.call(c, Channel.fromJson(d)),
    'CHANNEL_DELETE': (c, d) => onChannelDelete?.call(c, Channel.fromJson(d)),
    'CHANNEL_PINS_UPDATE': (c, d) {
      return onChannelPinsUpdate?.call(
        c,
        ChannelPinsUpdateEvent.fromJson(d),
      );
    },
    'GUILD_CREATE': (c, d) => onGuildCreate?.call(c, Guild.fromJson(d)),
    'GUILD_UPDATE': (c, d) => onGuildUpdate?.call(c, Guild.fromJson(d)),
    'GUILD_DELETE': (c, d) => onGuildDelete?.call(c, Guild.fromJson(d)),
    'GUILD_BAN_ADD': (c, d) =>
        onGuildBanAdd?.call(c, GuildBanAddEvent.fromJson(d)),
    'GUILD_BAN_REMOVE': (c, d) =>
        onGuildBanRemove?.call(c, GuildBanRemoveEvent.fromJson(d)),
    'GUILD_EMOJI_UPDATE': (c, d) =>
        onGuildEmojiUpdate?.call(c, GuildEmojiUpdateEvent.fromJson(d)),
    'GUILD_INTEGRATIONS_UPDATE': (c, d) => onGuildIntegrationsUpdate?.call(
        c, GuildIntegrationsUpdateEvent.fromJson(d)),
    'GUILD_MEMBER_ADD': (c, d) => onGuildMemberAdd?.call(c, Member.fromJson(d)),
    'GUILD_MEMBER_REMOVE': (c, d) =>
        onGuildMemberRemove?.call(c, GuildMemberRemoveEvent.fromJson(d)),
    'GUILD_MEMBER_UPDATE': (c, d) =>
        onGuildMemberUpdate?.call(c, GuildMemberUpdateEvent.fromJson(d)),
    'GUILD_MEMBERS_CHUNK': (c, d) =>
        onGuildMembersChunk?.call(c, GuildMembersChunkEvent.fromJson(d)),
    'GUILD_ROLE_CREATE': (c, d) =>
        onGuildRoleCreate?.call(c, GuildRoleCreateEvent.fromJson(d)),
    'GUILD_ROLE_UPDATE': (c, d) =>
        onGuildRoleUpdate?.call(c, GuildRoleUpdateEvent.fromJson(d)),
    'GUILD_ROLE_DELETE': (c, d) =>
        onGuildRoleDelete?.call(c, GuildRoleDeleteEvent.fromJson(d)),
    'INVITE_CREATE': (c, d) =>
        onInviteCreate?.call(c, InviteCreateEvent.fromJson(d)),
    'INVITE_DELETE': (c, d) =>
        onInviteDelete?.call(c, InviteDeleteEvent.fromJson(d)),
    'MESSAGE_CREATE': (c, d) => onMessageCreate?.call(c, Message.fromJson(d)),
    'MESSAGE_DELETE': (c, d) =>
        onMessageDelete?.call(c, MessageDeleteEvent.fromJson(d)),
    'MESSAGE_DELETE_BULK': (c, d) =>
        onMessageDeleteBulk?.call(c, MessageDeleteBulkEvent.fromJson(d)),
    'MESSAGE_REACTION_ADD': (c, d) =>
        onMessageReactionAdd?.call(c, MessageReactionAddEvent.fromJson(d)),
    'MESSAGE_REACTION_REMOVE': (c, d) => onMessageReactionRemove?.call(
        c, MessageReactionRemoveEvent.fromJson(d)),
    'MESSAGE_REACTION_REMOVE_ALL': (c, d) => onMessageReactionRemoveAll?.call(
        c, MessageReactionRemoveAllEvent.fromJson(d)),
    'MESSAGE_REACTION_REMOVE_EMOJI': (c, d) => onMessageReactionRemoveEmoji
        ?.call(c, MessageReactionRemoveEmojiEvent.fromJson(d)),
    'PRESENCE_UPDATE': (c, d) =>
        onPresenceUpdate?.call(c, PresenceUpdateEvent.fromJson(d)),
    'TYPING_START': (c, d) =>
        onTypingStart?.call(c, TypingStartEvent.fromJson(d)),
    'USER_UPDATE': (c, d) => onUserUpdate?.call(c, User.fromJson(d)),
    'VOICE_STATE_UPDATE': (c, d) =>
        onVoiceStateUpdate?.call(c, VoiceState.fromJson(d)),
    'VOICE_SERVER_UPDATE': (c, d) =>
        onVoiceServerUpdate?.call(c, VoiceServerUpdateEvent.fromJson(d)),
    'WEBHOOK_UPDATE': (c, d) =>
        onWebhookUpdate?.call(c, WebhookUpdateEvent.fromJson(d)),
    'APPLICATION_COMMAND_CREATE': (c, d) =>
        onApplicationCommandCreate?.call(c, ApplicationCommand.fromJson(d)),
    'APPLICATION_COMMAND_UPDATE': (c, d) =>
        onApplicationCommandUpdate?.call(c, ApplicationCommand.fromJson(d)),
    'APPLICATION_COMMAND_DELETE': (c, d) =>
        onApplicationCommandDelete?.call(c, ApplicationCommand.fromJson(d)),
    'INTERACTION_CREATE': (c, d) =>
        onInteractionCreate?.call(c, Interaction.fromJson(d)),
  };
}
