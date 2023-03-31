import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
part 'connection_provider.freezed.dart';

enum Statuses { notDetermined, isConnected, isDisonnected }

@freezed
abstract class ConnectivityStatus with _$ConnectivityStatus {
  const factory ConnectivityStatus({
    @Default(Statuses.notDetermined) Statuses curStatus,
  }) = _ConnectivityStatus;

  const ConnectivityStatus._();
}

final connectivityStatusProviders =
    StateNotifierProvider<ConnectivityStatusNotifier, ConnectivityStatus>(
        (ref) => ConnectivityStatusNotifier());

class ConnectivityStatusNotifier extends StateNotifier<ConnectivityStatus> {
  ConnectivityStatusNotifier() : super(const ConnectivityStatus()) {
    checkConnection();
  }

  void checkConnection() async {
    try {
      var r =
          await http.get(Uri.parse('https://api.chucknorris.io/jokes/random'));
      if (r.statusCode == 200) {
        state = state.copyWith(curStatus: Statuses.isConnected);
      } else {
        throw Exception('Loading failed');
      }
    } on SocketException {
      state = state.copyWith(curStatus: Statuses.isDisonnected);
    }
  }
}
