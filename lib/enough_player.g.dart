// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enough_player.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EnoughPlayer on _EnoughPlayerBase, Store {
  late final _$playerEnoughAtom =
      Atom(name: '_EnoughPlayerBase.playerEnough', context: context);

  @override
  bool get playerEnough {
    _$playerEnoughAtom.reportRead();
    return super.playerEnough;
  }

  @override
  set playerEnough(bool value) {
    _$playerEnoughAtom.reportWrite(value, super.playerEnough, () {
      super.playerEnough = value;
    });
  }

  late final _$_EnoughPlayerBaseActionController =
      ActionController(name: '_EnoughPlayerBase', context: context);

  @override
  void playerEnoughChange(bool newPlayerEnough) {
    final _$actionInfo = _$_EnoughPlayerBaseActionController.startAction(
        name: '_EnoughPlayerBase.playerEnoughChange');
    try {
      return super.playerEnoughChange(newPlayerEnough);
    } finally {
      _$_EnoughPlayerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
playerEnough: ${playerEnough}
    ''';
  }
}
