import 'dart:async';
import 'package:fire_boot/main.dart';
import 'package:get/get.dart';
import 'package:fire_boot/base/getx/page_state.dart';
import 'package:flutter/material.dart';

abstract class BaseController extends GetxController {

  late Function onErrorPageNext;

  ///Reload the page
  final _shouldRefresh = false.obs;
  refreshPage(bool refresh) => _shouldRefresh(refresh);

  ///Control page state
  final _pageStateContainer = PageState.DEFAULT.obs;
  PageState get pageState => _pageStateContainer.value;
  updatePageState(PageState state)=> _pageStateContainer(state);
  resetPageState() => _pageStateContainer(PageState.DEFAULT);

  showErrorPage(Function onNext){
    onErrorPageNext = onNext;
    updatePageState(PageState.FAILED);
  }


  showEmptyPage() => updatePageState(PageState.EMPTY);
  showNoLoginPage() => updatePageState(PageState.NEED_LOGIN);
  showLoadingPage() => updatePageState(PageState.LOADING);
  hideStatePage() => resetPageState();

  ///General Message Handler
  final _messageContainer = "".obs;
  String get message => _messageContainer.value;
  showMessage(String msg) => _messageContainer(msg);

  ///Error Message Handler
  final _errorMessageContainer = "".obs;
  String get errorMessage => _errorMessageContainer.value;
  showErrorMessage(String msg) => _errorMessageContainer(msg);

  ///Success Message Handler
  final _successMessageContainer = "".obs;
  String get successMessage => _messageContainer.value;
  showSuccessMessage(String msg) => _successMessageContainer(msg);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }


}