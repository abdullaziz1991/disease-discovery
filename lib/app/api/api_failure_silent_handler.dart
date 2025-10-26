import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../app_popup/app_snack_bar.dart';
import '../../core/failure/failure_message.dart';
import '../../core/failure/failures_extends.dart';

class ApiFailureSilentHandler {
  static void handleFailure({
    required Failure failure,
    required BuildContext context,
    void Function()? retryAction,
  }) {
    print("❌ Failure: ${failureMessage(failure)}");
    if (failure is UpdateRequiredFailure) {
      // عرض حوار تحديث التطبيق الإجباري
      // showForceUpdateDialog(context, failure.updateUrl);
    } else if (failure is ExpiredTokenFailure) {
      // GetIt.I<ProfileBloc>().add(SignOutProfileEvent(context: context));
    } else if (failure is OfflineFailure || failure is TimeoutFailure) {
      AppSnackBar.show(context, failureMessage(failure));
      Future.delayed(const Duration(seconds: 1), retryAction);
    } else {
      Future.delayed(const Duration(seconds: 1), retryAction);
    }
  }
}

        // ApiFailureHandler.handleFailure(
        //     context: event.context,
        //     failure: failure,
        //     retryAction: () => );