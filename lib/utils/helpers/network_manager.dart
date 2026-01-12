import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../popups/loaders.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();

  // Update: Subscription now listens to a List
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  // Update: Status is now a List
  final RxList<ConnectivityResult> _connectionStatus =
      <ConnectivityResult>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Listening to the updated stream signature
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      _updateConnectionStatus,
    );
  }

  /// Updates status and alerts user if all connections are lost
  void _updateConnectionStatus(List<ConnectivityResult> results) {
    _connectionStatus.value = results;

    // Check if the list contains 'none' or is empty
    if (_connectionStatus.contains(ConnectivityResult.none)) {
      YLoaders.customToast(message: 'No Internet Connection');
    }
  }

  /// Improved check: returns true if ANY connection is active
  Future<bool> isConnected() async {
    try {
      final List<ConnectivityResult> results = await _connectivity
          .checkConnectivity();

      if (results.isEmpty || results.contains(ConnectivityResult.none)) {
        return false;
      }
      return true;
    } on PlatformException catch (_) {
      return false;
    }
  }

  @override
  void onClose() {
    _connectivitySubscription.cancel();
    super.onClose();
  }
}
