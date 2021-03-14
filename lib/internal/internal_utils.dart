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
