import 'package:flutter/material.dart';

abstract class BaseNavigator {
  void showLoading({String message});

  void showMessage(String message);

  void hideLoading();

  void navigate();
}

abstract class BaseViewModel<NAV extends BaseNavigator> extends ChangeNotifier {
  NAV? navigator;
}

abstract class BaseView<T extends StatefulWidget, VM extends BaseViewModel>
    extends State<T> {
  late VM viewModel;

  VM initViewModel();

  @override
  void initState() {
    super.initState();
    viewModel = initViewModel();
  }

  @override
  void hideLoading() {
    Navigator.pop(context);
  }

  @override
  void showLoading({String message = "Loading"}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: Row(
              children: [
                Text(message),
                SizedBox(
                  width: 10,
                ),
                CircularProgressIndicator(),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void showMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(message),
        );
      },
    );
  }
}
