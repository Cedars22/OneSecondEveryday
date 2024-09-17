import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'scroll_controller_provider.g.dart';

@riverpod
class ScrollControllerProvider extends _$ScrollControllerProvider {
  @override
  ScrollController build() {
    return ScrollController();
  }
}
