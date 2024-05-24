// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LocationController on LocationControllerBase, Store {
  late final _$locationAtom =
      Atom(name: 'LocationControllerBase.location', context: context);

  @override
  Position? get location {
    _$locationAtom.reportRead();
    return super.location;
  }

  @override
  set location(Position? value) {
    _$locationAtom.reportWrite(value, super.location, () {
      super.location = value;
    });
  }

  late final _$LocationControllerBaseActionController =
      ActionController(name: 'LocationControllerBase', context: context);

  @override
  void setLocation(Position v) {
    final _$actionInfo = _$LocationControllerBaseActionController.startAction(
        name: 'LocationControllerBase.setLocation');
    try {
      return super.setLocation(v);
    } finally {
      _$LocationControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
location: ${location}
    ''';
  }
}
