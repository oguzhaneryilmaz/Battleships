// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'is_ship_hit.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$IsShipHit on _IsShipHitBase, Store {
  late final _$didShipHitAtom =
      Atom(name: '_IsShipHitBase.didShipHit', context: context);

  @override
  bool get didShipHit {
    _$didShipHitAtom.reportRead();
    return super.didShipHit;
  }

  @override
  set didShipHit(bool value) {
    _$didShipHitAtom.reportWrite(value, super.didShipHit, () {
      super.didShipHit = value;
    });
  }

  @override
  String toString() {
    return '''
didShipHit: ${didShipHit}
    ''';
  }
}
