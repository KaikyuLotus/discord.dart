import 'package:discord/entities/ops/rpcable.dart';

class Heartbeat implements Rpcable {
  static final int op = 2;

  String? toJson() {
    return null;
  }

  @override
  Map rpc() {
    return {
      'op': Heartbeat.op,
      'd': null,
    };
  }
}
