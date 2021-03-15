import 'package:discord/discord.dart';
import 'package:discord/internal/internal.dart';

class Message {
  final String id;
  final String channelId;
  final String? guildId;
  final User author;
  final Member? member;
  final String content;
  final String timestamp; // TODO ISO8601 timestamp
  final String? editedTimestamp;
  final bool tts;
  final bool mentionEveryone;
  final List<User> mentions;
  final List<Role> mentionRoles;
  final List<ChannelMention>? mentionChannels;
  final List<Attachment> attachments;
  final List<Embed> embeds;
  final List<Reaction>? reactions;
  final String? nonce;
  final bool pinned;
  final String? webhookId;
  final int type;
  final MessageActivity? activity;
  final MessageApplication? application;
  final MessageReference? messageReference;
  final int? flags;
  final List<Sticker>? stickers;
  final Message? referencedMessage;
  final MessageInteraction? interaction;

  Message({
    required this.id,
    required this.channelId,
    this.guildId,
    required this.author,
    this.member,
    required this.content,
    required this.timestamp,
    this.editedTimestamp,
    required this.tts,
    required this.mentionEveryone,
    required this.mentions,
    required this.mentionRoles,
    this.mentionChannels,
    required this.attachments,
    required this.embeds,
    this.reactions,
    this.nonce,
    required this.pinned,
    this.webhookId,
    required this.type,
    this.activity,
    this.application,
    this.messageReference,
    this.flags,
    this.stickers,
    this.referencedMessage,
    this.interaction,
  });

  static Message fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'],
      channelId: json['channel_id'],
      guildId: json['guild_id'],
      author: User.fromJson(json['author']),
      member: ifNotNull(Member.fromJson, json['member']),
      content: json['content'],
      timestamp: json['timestamp'],
      editedTimestamp: json['edited_timestamp'],
      tts: json['tts'],
      mentionEveryone: json['mention_everyone'],
      mentions: fromArray(User.fromJson, json['mentions'])!,
      mentionRoles: fromArray(Role.fromJson, json['mention_roles'])!,
      mentionChannels: fromArray(
        ChannelMention.fromJson,
        json['mention_channels'],
      ),
      attachments: fromArray(Attachment.fromJson, json['attachments'])!,
      embeds: fromArray(Embed.fromJson, json['embeds'])!,
      reactions: fromArray(Reaction.fromJson, json['reactions']),
      nonce: json['nonce'],
      pinned: json['pinned'],
      webhookId: json['webhook_id'],
      type: json['type'],
      activity: ifNotNull(MessageActivity.fromJson, json['activity']),
      application: ifNotNull(MessageApplication.fromJson, json['application']),
      messageReference: ifNotNull(
        MessageReference.fromJson,
        json['message_reference'],
      ),
      flags: json['flags'],
      stickers: fromArray(Sticker.fromJson, json['stickers']),
      referencedMessage:
          ifNotNull(Message.fromJson, json['referenced_message']),
      interaction: ifNotNull(MessageInteraction.fromJson, json['interaction']),
    );
  }

  Map toJson() {
    return {
      'id': id,
      'channel_id': channelId,
      'guild_id': guildId,
      'author': author,
      'member': member,
      'content': content,
      'timestamp': timestamp,
      'edited_timestamp': editedTimestamp,
      'tts': tts,
      'mention_everyone': mentionEveryone,
      'mentions': mentions,
      'mention_roles': mentionRoles,
      'mention_channels': mentionChannels,
      'attachments': attachments,
      'embeds': embeds,
      'reactions': reactions,
      'nonce': nonce,
      'pinned': pinned,
      'webhook_id': webhookId,
      'type': type,
      'activity': activity,
      'application': application,
      'message_reference': messageReference,
      'flags': flags,
      'stickers': stickers,
      'referenced_message': referencedMessage,
      'interaction': interaction,
    };
  }
}
