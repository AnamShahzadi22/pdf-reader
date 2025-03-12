import 'package:flutter/material.dart';

const whiteColor =  Colors.white;
const blackColor = Colors.black;

const greyColor = Colors.grey;
const darkGreyColor = Color(0XFF79737A);
const redColor = Colors.red;
const red2Color = Color(0XFFFF0D0D);
const btnColor = Color(0xFFFFC422);
const purpleColor = Color(0xFFBA68F8);




LinearGradient linearGradientBackground =LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
  colors: [
    Color(0xFF1D013C),
    Color(0xFF310266),
    Color(0xFF3C027D),
  ],
);

LinearGradient linearGradientInnerContainer =LinearGradient(
  begin: Alignment.bottomRight,
  end: Alignment.topLeft,
  colors: [
    Color(0xFF1D013C),
    Color(0xFF310266),
  ],
);


LinearGradient linearGradientIndicator = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    Color(0xFFDC52D1),
    Color(0xFFAD67DE),
    Color(0xFF018BE4),
    Color(0xFF00786C),
    Color(0xFF009D7D),
    Color(0xFF8DD673),
  ],
);

LinearGradient linearGradientIndicator2 = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    Color(0xFFBFAAFF),
    Color(0xFFF64CFF),
    Color(0xFFFFC553),
  ],
);

LinearGradient linearGradientTextField =LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    Color(0xFFE01CF4),
    Color(0xFF2E98FC),

  ],
);

LinearGradient linearGradientSplash =LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
  colors: [
    Color(0xFF471C7C),
    Color(0xFF7628D6),

  ],
);


LinearGradient linearGradientInside = LinearGradient(
  begin: Alignment.bottomRight,
  end: Alignment.topLeft,
  colors: [
    Color(0xff3c0c74),
    Color(0xFF400c6c),
  ],
);

LinearGradient radialGradientThankYou = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    // Color(0xFF6e0a94), // Slightly darker purple transitioning to pink.
    Color(0xFF400c6c), // Deep dark purple (dominant outer color).
    Color(0xFF6e0a94), // Slightly darker purple transitioning to pink.
  ],
);


LinearGradient linearGradientSelectedCard = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xff0C3580),
    Color(0xFF112B5B),
  ],
);

LinearGradient linearGradientText = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xff4983F6),
    Color(0xFFC175F5),
    Color(0xFFFBACB7),
  ],
);

LinearGradient linearGradientButton = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xFFFF34EF),
    Color(0xff75036e),
    // Color(0xFFE01CF4),
  ],
);

LinearGradient linearGradientButton2 = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    Color(0xFF6B41FF),
    Color(0xffF64CFF),
    Color(0xffFFC553),
    // Color(0xFFE01CF4),
  ],
);