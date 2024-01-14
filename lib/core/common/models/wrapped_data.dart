/// Basically [T] or [Exception].
class WrappedData<T> {
  final T? data;
  final Exception? exception;

  WrappedData({
    this.data,
    this.exception,
  });

  factory WrappedData.ofData(T data) {
    return WrappedData<T>(data: data);
  }

  factory WrappedData.ofException(Exception exception) {
    return WrappedData(exception: exception);
  }

  bool get hasData => data != null;
}
