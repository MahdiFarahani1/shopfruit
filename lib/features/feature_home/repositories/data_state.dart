abstract class DataState<T> {
  final T? data;
  final String? message;

  DataState(this.data, this.message);
}

class DataSuccses<T> extends DataState<T> {
  DataSuccses(T data) : super(data, null);
}

class DataFailed<T> extends DataState<T> {
  DataFailed(String message) : super(null, message);
}
