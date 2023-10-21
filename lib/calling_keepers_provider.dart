import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_test/calling_keeper.dart';

part 'calling_keepers_provider.g.dart';

@riverpod
class CallingKeepers extends _$CallingKeepers {
  @override
  List<CallingKeeper> build() {
    return [];
  }

  void saveCalling(CallingKeeper calling) {
    final index = state.indexWhere((c) => c.callingUuid == calling.callingUuid);
    if (index >= 0) {
      state[index] = calling;
    } else {
      state.add(calling);
    }
  }

  void deleteCalling(String callingUuid) {
    final index = state.indexWhere((c) => c.callingUuid == callingUuid);
    if (index != -1) {
      state.removeAt(index);
    }
  }
}