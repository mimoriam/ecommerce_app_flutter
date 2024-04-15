import 'package:ecommerce_app_flutter/src/common/error_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({super.key, required this.value, required this.data});
  final AsyncValue<T> value;
  final Widget Function(T) data;

  @override
  Widget build(BuildContext context) {
    return value.when(
        data: data,
        error: (err, stackTrace) => Center(child: ErrorMessageWidget(err.toString())),
        loading: () => const Center(child: CircularProgressIndicator()));
  }
}