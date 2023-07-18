import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Size appDefaultDesignSize = const Size(360, 690);

class AppPaddings {
  //all
  static EdgeInsets all_4Padding =
      EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w);
  static EdgeInsets all_8Padding =
      EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w);
  static EdgeInsets all_14Padding =
      EdgeInsets.symmetric(vertical: 14.h, horizontal: 14.w);
  static EdgeInsets all_12Padding =
      EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w);
  static EdgeInsets all_16Padding =
      EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w);
  static EdgeInsets all_32Padding =
      EdgeInsets.symmetric(vertical: 32.h, horizontal: 32.w);

  //left
  static EdgeInsets left_8Padding = EdgeInsets.only(left: 8.h);
  static EdgeInsets left_12Padding = EdgeInsets.only(left: 12.h);
  static EdgeInsets left_16Padding = EdgeInsets.only(left: 16.w);
  static EdgeInsets left_4Padding = EdgeInsets.only(left: 4.h);

  //right
  static EdgeInsets right_4Padding = EdgeInsets.only(right: 4.w);
  static EdgeInsets right_8Padding = EdgeInsets.only(right: 8.w);
  static EdgeInsets right_12Padding = EdgeInsets.only(right: 12.w);
  static EdgeInsets right_14Padding = EdgeInsets.only(right: 12.w);
  static EdgeInsets right_16Padding = EdgeInsets.only(right: 16.w);
  static EdgeInsets right_25Padding = EdgeInsets.only(right: 25.w);
  static EdgeInsets right_50Padding = EdgeInsets.only(right: 50.w);

  //top
  static EdgeInsets top_8Padding = EdgeInsets.only(top: 8.h);
  static EdgeInsets top_16Padding = EdgeInsets.only(top: 16.h);
  static EdgeInsets top_4Padding = EdgeInsets.only(top: 4.h);
  static EdgeInsets top_12Padding = EdgeInsets.only(top: 12.h);
  static EdgeInsets top_14Padding = EdgeInsets.only(top: 14.h);
  static EdgeInsets top_45Padding = EdgeInsets.only(top: 45.h);

  //bottom
  static EdgeInsets bottom_8Padding = EdgeInsets.only(bottom: 8.h);
  static EdgeInsets bottom_16Padding = EdgeInsets.only(bottom: 16.h);
  static EdgeInsets bottom_4Padding = EdgeInsets.only(bottom: 4.h);
  static EdgeInsets bottom_12Padding = EdgeInsets.only(bottom: 12.h);
  static EdgeInsets bottom_14Padding = EdgeInsets.only(bottom: 14.h);

  //vertical
  static EdgeInsets vertical_4Padding = EdgeInsets.symmetric(vertical: 4.w);
  static EdgeInsets vertical_8Padding = EdgeInsets.symmetric(vertical: 8.w);
  static EdgeInsets vertical_12Padding = EdgeInsets.symmetric(vertical: 12.w);
  static EdgeInsets vertical_14Padding = EdgeInsets.symmetric(vertical: 14.w);
  static EdgeInsets vertical_16Padding = EdgeInsets.symmetric(vertical: 16.w);

  //horizontal
  static EdgeInsets horizontal_8Padding = EdgeInsets.symmetric(horizontal: 8.w);
  static EdgeInsets horizontal_4Padding = EdgeInsets.symmetric(horizontal: 4.w);
  static EdgeInsets horizontal_12Padding =
      EdgeInsets.symmetric(horizontal: 12.w);
  static EdgeInsets horizontal_14Padding =
      EdgeInsets.symmetric(horizontal: 14.w);
  static EdgeInsets only({
    double? t,
    double? b,
    double? l,
    double? r,
  }) =>
      EdgeInsets.only(
        bottom: b ?? 0.0,
        left: l ?? 0.0,
        right: r ?? 0.0,
        top: t ?? 0.0,
      );
}

class AppSpacing {
  static SizedBox vertical_4 = SizedBox(
    height: 4.h,
  );
  static SizedBox horizontal_4 = SizedBox(
    width: 4.w,
  );
  static SizedBox vertical_12 = SizedBox(
    height: 12.h,
  );
  static SizedBox horizontal_12 = SizedBox(
    width: 12.w,
  );
  static SizedBox vertical_16 = SizedBox(
    height: 16.h,
  );
  static SizedBox horizontal_16 = SizedBox(
    width: 16.w,
  );
  static SizedBox vertical_18 = SizedBox(
    height: 18.h,
  );
  static SizedBox horizontal_18 = SizedBox(
    width: 18.w,
  );
  static SizedBox vertical_20 = SizedBox(
    height: 20.h,
  );
  static SizedBox horizontal_20 = SizedBox(
    width: 20.w,
  );
  static SizedBox vertical_24 = SizedBox(
    height: 24.h,
  );
  static SizedBox vertical_60 = SizedBox(
    height: 60.h,
  );

  static SizedBox horizontal_24 = SizedBox(
    width: 24.h,
  );
  static SizedBox vertical_8 = SizedBox(
    height: 8.h,
  );
  static SizedBox horizontal_8 = SizedBox(
    width: 8.w,
  );
  static SizedBox vertical_14 = SizedBox(
    height: 14.h,
  );
  static SizedBox horizontal_14 = SizedBox(
    width: 14.w,
  );
}
