// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_finished.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GameFinished on _GameFinishedBase, Store {
  late final _$didUWinAtom =
      Atom(name: '_GameFinishedBase.didUWin', context: context);

  @override
  bool get didUWin {
    _$didUWinAtom.reportRead();
    return super.didUWin;
  }

  @override
  set didUWin(bool value) {
    _$didUWinAtom.reportWrite(value, super.didUWin, () {
      super.didUWin = value;
    });
  }

  @override
  String toString() {
    return '''
didUWin: ${didUWin}
    ''';
  }
}
