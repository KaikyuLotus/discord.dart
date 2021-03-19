T? ifNotNull<T, R>(T Function(R) foo, dynamic? parameter) {
  return parameter != null ? foo(parameter) : null;
}

List<T>? fromArray<T>(
  T Function(Map<String, dynamic>) foo,
  List<dynamic>? jsonArr,
) {
  if (jsonArr == null) return null;
  return List.generate(jsonArr.length, (i) => foo(jsonArr[i]));
}

Map insertNotNull(String key, dynamic value, {bool str = false}) {
  return value != null ? {key: str ? '$value' : value} : {};
}

Map insertNotDefault(
  String key,
  dynamic value,
  dynamic defaultVal, {
  bool str = false,
}) {
  return value != defaultVal
      ? {key: (str && value != null) ? '$value' : value}
      : {};
}

extension MapExt on Map {
  void filterNullValues<K, V>() {
    removeWhere((_, value) => value == null);
  }
}
