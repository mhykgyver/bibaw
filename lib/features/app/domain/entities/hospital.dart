import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class Hospital extends Equatable {
  final String hospitalID;
  final String name;
  final String location;

  const Hospital({
    @required this.hospitalID,
    @required this.name,
    @required this.location,
  });

  @override
  List<Object> get props => [
        hospitalID,
        name,
        location,
      ];
}
