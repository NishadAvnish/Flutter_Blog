import 'dart:math';

import 'package:flutter/widgets.dart';

mixin VerificationChecker {
  checkVerificationStatus(VoidCallback onSuccess) {
    // make your api call to check status but for demo purpose we will use Random method
    Random random = Random();
    int randomNumber = random.nextInt(3);

    // if the random number is 1 then we will print unerified user
    // else we will run the callback
    if (randomNumber == 1) {
      print("userUnverfied");
    } else {
      onSuccess();
    }
  }
}
