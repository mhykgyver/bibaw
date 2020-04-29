import 'package:flutter/widgets.dart';

import '../../domain/entities/parent.dart';

class ParentModel extends Parent {
  const ParentModel({
    @required parentID,
    @required firstName,
    @required lastName,
    middleInitial,
    @required birthDate,
    gender,
  }) : super(
          parentID: parentID,
          firstName: firstName,
          lastName: lastName,
          middleInitial: middleInitial,
          birthDate: birthDate,
          gender: gender,
        );
}
