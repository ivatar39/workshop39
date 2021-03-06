import 'package:flutter/material.dart';

import '../../../../core/constants.dart';

Color getColor(List tags) {
  if (tags.length > 1) {
    return kColorsTagMap.values.last;
  } else {
    return kColorsTagMap[tags.first];
  }
}

String getEmojiPrefix(List tags) {
  if (tags.length > 1) {
    return kEmojiMap.values.last;
  } else {
    return kEmojiMap[tags.first];
  }
}
