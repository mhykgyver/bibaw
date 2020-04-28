import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class Hospital extends Equatable {
  final String _hospitalID;
  final String _name;
  final String _location;
  final String _room;

  const Hospital({
    @required hospitalID,
    @required name,
    @required location,
    @required room,
  })  : _hospitalID = hospitalID,
        _name = name,
        _location = location,
        _room = room;

  @override
  List<Object> get props => [
        _hospitalID,
        _name,
        _location,
        _room,
      ];
}
