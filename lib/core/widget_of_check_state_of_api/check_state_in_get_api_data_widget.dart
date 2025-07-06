import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:risk/core/state/state_data.dart';
import 'package:risk/features/home/page/home_page.dart';
import 'package:risk/features/shares/data/model/shares_data.dart';
import '../remote_helper/remote_exception.dart';
import '../state/state.dart';
import '../widget/empty_wallet_widget.dart';
import '../widget/message_flushbar_widget.dart';
import '../widget/no_internet_connection_widget.dart';

class CheckStateInGetApiDataWidget extends StatelessWidget {
  final Widget? widgetOfData;
  final Widget? widgetOfLoading;

  final DataState state;

  const CheckStateInGetApiDataWidget(
      {super.key,
      required this.state,
      this.widgetOfData,
      this.widgetOfLoading});

  @override
  Widget build(BuildContext context) {
    print(state.stateData);
    if (state.stateData == States.loaded) {
      // return state.data!.isEmpty?EmptyWalletWidget() :widgetOfData!;
      return widgetOfData!;

    } else if (state.stateData == States.error) {
      if (state.exception!.type == DioExceptionType.connectionError) {
        return NoInternetConnectionWidget();
      } else {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          flushBarErrorWidget(
            context: context,
            title: MessageOfErorrApi.getExeptionMessage(state.exception!).first,
            text: MessageOfErorrApi.getExeptionMessage(state.exception!).last,
          );
          state.stateData = States.initial;
        });
      }
    } else if (state.stateData == States.loading) {
      return widgetOfLoading ??
          const Center(child: CircularProgressIndicator());
    } else {
      return const SizedBox();
    }
    return const SizedBox();
  }
}
