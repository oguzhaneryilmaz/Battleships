// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'whose_turn.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WhoseTurn on _WhoseTurnBase, Store {
  late final _$turnWhoseAtom =
      Atom(name: '_WhoseTurnBase.turnWhose', context: context);

  @override
  bool get turnWhose {
    _$turnWhoseAtom.reportRead();
    return super.turnWhose;
  }

  @override
  set turnWhose(bool value) {
    _$turnWhoseAtom.reportWrite(value, super.turnWhose, () {
      super.turnWhose = value;
    });
  }

  @override
  String toString() {
    return '''
turnWhose: ${turnWhose}
    ''';
  }
}
