import 'package:discord/discord.dart';
import 'package:discord/entities/ops/rpcable.dart';

class Identify implements Rpcable {
  static final int op = 2;

  final String token;
  final ConnectionProperties properties;
  final bool? compress;
  final int? largeThreshold;
  final List<int>? shard;
  final UpdateStatus? presence;
  final bool? guildSubscriptions;
  final List<Intent> intents;

  int get intentsShift => intents.isEmpty
      ? 0
      : (intents.map((i) => 1 << i.value).reduce((a, b) => a + b));

  Identify({
    required this.token,
    required this.properties,
    this.compress,
    this.largeThreshold,
    this.shard,
    this.presence,
    this.guildSubscriptions,
    required this.intents,
  });

  Map toJson() {
    print(intentsShift);
    return {
      'token': token,
      'properties': properties,
      'compress': compress,
      'large_threshold': largeThreshold,
      'shard': shard,
      'presence': presence,
      'guild_subscriptions': guildSubscriptions,
      'intents': intentsShift,
    };
  }

  @override
  Map rpc() {
    return {
      'op': Identify.op,
      'd': this,
    };
  }
}
