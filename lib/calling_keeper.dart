
import 'package:freezed_annotation/freezed_annotation.dart';

part 'calling_keeper.freezed.dart';

@freezed
class CallingKeeper with _$CallingKeeper {
  factory CallingKeeper({
    required String callingUuid,
    @Default(true) bool isHave,
  }) = _CallingKeeper;
}