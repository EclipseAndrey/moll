part of 'themes.dart';

ThemeData _dark = ThemeData(
    splashColor: C.white,
    highlightColor: C.white,
    scaffoldBackgroundColor: C.white,
    backgroundColor: HexColor.fromHex('#aabbcc'),
    fontFamily: MollThemes.fontFamily,
    iconTheme: IconThemeData(color: C.standartBlack),
    appBarTheme: AppBarTheme(
        backgroundColor: C.white,
        titleTextStyle: TextStyle(
            color: C.standartBlack,
            fontSize: 18,
            fontFamily: MollThemes.fontFamily,
            fontWeight: FontWeight.w600)),
    textTheme: TextTheme(
        headline1: TextStyle(
            color: C.standartBlack,
            fontSize: 56,
            fontWeight: FontWeight.w600,
            fontFamily: MollThemes.fontFamily),

        ///Headers 24
        headline2: TextStyle(
            color: C.standartBlack,
            fontSize: 24,
            fontWeight: FontWeight.w600,
            fontFamily: MollThemes.fontFamily),

        ///Headers 18
        headline3: TextStyle(
          color: C.standartBlack,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          fontFamily: MollThemes.fontFamily,
        ),

        ///Hint
        caption: const TextStyle(
            color: C.greyDisabledMiddle,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: MollThemes.fontFamily),

        ///Body 18
        bodyText1: TextStyle(
          color: C.standartBlack,
          fontSize: 18,
          fontWeight: FontWeight.w400,
          fontFamily: MollThemes.fontFamily,
        ),

        ///Body 16
        bodyText2: TextStyle(
          color: C.standartBlack,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontFamily: MollThemes.fontFamily,
        )));
