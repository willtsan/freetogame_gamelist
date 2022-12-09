// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeControllerBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_HomeControllerBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isErrorAtom =
      Atom(name: '_HomeControllerBase.isError', context: context);

  @override
  bool get isError {
    _$isErrorAtom.reportRead();
    return super.isError;
  }

  @override
  set isError(bool value) {
    _$isErrorAtom.reportWrite(value, super.isError, () {
      super.isError = value;
    });
  }

  late final _$contentForDisplayAtom =
      Atom(name: '_HomeControllerBase.contentForDisplay', context: context);

  @override
  ObservableList<GameDto> get contentForDisplay {
    _$contentForDisplayAtom.reportRead();
    return super.contentForDisplay;
  }

  @override
  set contentForDisplay(ObservableList<GameDto> value) {
    _$contentForDisplayAtom.reportWrite(value, super.contentForDisplay, () {
      super.contentForDisplay = value;
    });
  }

  late final _$getListOfGamesAsyncAction =
      AsyncAction('_HomeControllerBase.getListOfGames', context: context);

  @override
  Future<void> getListOfGames() {
    return _$getListOfGamesAsyncAction.run(() => super.getListOfGames());
  }

  late final _$applyFiltersAsyncAction =
      AsyncAction('_HomeControllerBase.applyFilters', context: context);

  @override
  Future<void> applyFilters({String? filter}) {
    return _$applyFiltersAsyncAction
        .run(() => super.applyFilters(filter: filter));
  }

  late final _$orderDataAsyncAction =
      AsyncAction('_HomeControllerBase.orderData', context: context);

  @override
  Future<void> orderData(String orderKey, {bool? reverse}) {
    return _$orderDataAsyncAction
        .run(() => super.orderData(orderKey, reverse: reverse));
  }

  late final _$resetPageAsyncAction =
      AsyncAction('_HomeControllerBase.resetPage', context: context);

  @override
  Future<void> resetPage() {
    return _$resetPageAsyncAction.run(() => super.resetPage());
  }

  late final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase', context: context);

  @override
  void setIsLoading(bool value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsError(bool value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setIsError');
    try {
      return super.setIsError(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  GameDto? getGameById(int id) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.getGameById');
    try {
      return super.getGameById(id);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isError: ${isError},
contentForDisplay: ${contentForDisplay}
    ''';
  }
}
