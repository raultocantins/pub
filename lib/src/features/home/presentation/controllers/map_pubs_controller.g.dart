// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_pubs_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MapPubsController on MapPubsControllerBase, Store {
  late final _$sliderValueAtom =
      Atom(name: 'MapPubsControllerBase.sliderValue', context: context);

  @override
  double get sliderValue {
    _$sliderValueAtom.reportRead();
    return super.sliderValue;
  }

  @override
  set sliderValue(double value) {
    _$sliderValueAtom.reportWrite(value, super.sliderValue, () {
      super.sliderValue = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'MapPubsControllerBase.isLoading', context: context);

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
      Atom(name: 'MapPubsControllerBase.isError', context: context);

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

  late final _$pubsAtom =
      Atom(name: 'MapPubsControllerBase.pubs', context: context);

  @override
  List<MapPubEntity>? get pubs {
    _$pubsAtom.reportRead();
    return super.pubs;
  }

  @override
  set pubs(List<MapPubEntity>? value) {
    _$pubsAtom.reportWrite(value, super.pubs, () {
      super.pubs = value;
    });
  }

  late final _$MapPubsControllerBaseActionController =
      ActionController(name: 'MapPubsControllerBase', context: context);

  @override
  void setLoading(bool v) {
    final _$actionInfo = _$MapPubsControllerBaseActionController.startAction(
        name: 'MapPubsControllerBase.setLoading');
    try {
      return super.setLoading(v);
    } finally {
      _$MapPubsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(bool v) {
    final _$actionInfo = _$MapPubsControllerBaseActionController.startAction(
        name: 'MapPubsControllerBase.setError');
    try {
      return super.setError(v);
    } finally {
      _$MapPubsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSliderValue(double v) {
    final _$actionInfo = _$MapPubsControllerBaseActionController.startAction(
        name: 'MapPubsControllerBase.setSliderValue');
    try {
      return super.setSliderValue(v);
    } finally {
      _$MapPubsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPubs(List<MapPubEntity> v) {
    final _$actionInfo = _$MapPubsControllerBaseActionController.startAction(
        name: 'MapPubsControllerBase.setPubs');
    try {
      return super.setPubs(v);
    } finally {
      _$MapPubsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
sliderValue: ${sliderValue},
isLoading: ${isLoading},
isError: ${isError},
pubs: ${pubs}
    ''';
  }
}
