// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_post_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DetailPostController on DetailPostControllerBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'DetailPostControllerBase.isLoading', context: context);

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
      Atom(name: 'DetailPostControllerBase.isError', context: context);

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

  late final _$entityAtom =
      Atom(name: 'DetailPostControllerBase.entity', context: context);

  @override
  DetailEntity? get entity {
    _$entityAtom.reportRead();
    return super.entity;
  }

  @override
  set entity(DetailEntity? value) {
    _$entityAtom.reportWrite(value, super.entity, () {
      super.entity = value;
    });
  }

  late final _$DetailPostControllerBaseActionController =
      ActionController(name: 'DetailPostControllerBase', context: context);

  @override
  void setLoading(bool v) {
    final _$actionInfo = _$DetailPostControllerBaseActionController.startAction(
        name: 'DetailPostControllerBase.setLoading');
    try {
      return super.setLoading(v);
    } finally {
      _$DetailPostControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(bool v) {
    final _$actionInfo = _$DetailPostControllerBaseActionController.startAction(
        name: 'DetailPostControllerBase.setError');
    try {
      return super.setError(v);
    } finally {
      _$DetailPostControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDetail(DetailEntity v) {
    final _$actionInfo = _$DetailPostControllerBaseActionController.startAction(
        name: 'DetailPostControllerBase.setDetail');
    try {
      return super.setDetail(v);
    } finally {
      _$DetailPostControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isError: ${isError},
entity: ${entity}
    ''';
  }
}
