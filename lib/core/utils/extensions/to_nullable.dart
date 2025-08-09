import 'package:taqueria_vargas/core/utils/states/nullable.dart';

extension ToNullable<T> on T? {
  Nullable<T> toNullable() => Nullable.set(this);
}