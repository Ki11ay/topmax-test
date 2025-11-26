import 'package:flutter/material.dart';

class AppConstants {
  // Colors
  static const Color primaryBlue = Color(0xFF3170CE);
  static const Color buttonBlue = Color(0xFF3170CE);
  static const Color darkBlue = Color(0xFF1976D2);
  static const Color jobCardColor = Color(0xFFF1F4FD);
  static const Color lightBlue = Color(0xFFE3F2FD);
  static const Color backgroundColor = Color(0xFFF4F7FF);
  static const Color cardColor = Colors.white;
  static const Color textPrimary = Color(0xFF111111);
  static const Color textSecondary = Color(0xFF4D4D4D);
  static const Color textTertiary = Color(0xFF434343);
  static const Color accentColor = Color(0xFFFF9800);
  static const Color errorColor = Color(0xFFD32F2F);
  static const Color successColor = Color(0xFF388E3C);
  static const Color sliverAppBarGradientStart = Color(0xFFC5D9FF);
  static const Color sliverAppBarGradientEnd = Color(0xFFF1F4FD);
  static const Color urgentColor = Color(0xFFFFD6D6);
  static const Color multipleHiresColor = Color(0xFFD4EDDA);
  static const Color newJobColor = Color(0xFFE3D7FF);
  static const Color jobSalaryBorderColor = Color(0xFFE3E6EB);

  /// Usage Example:
  /// 
  /// In your SliverAppBar (or any AppBar/Container/etc) use:
  ///
  ///   Container(
  ///     decoration: const BoxDecoration(
  ///       gradient: AppConstants.sliverAppBarGradient,
  ///     ),
  ///     child: ...,
  ///   )
  /// 
  /// For a SliverAppBar:
  /// 
  ///   SliverAppBar(
  ///     flexibleSpace: Container(
  ///       decoration: const BoxDecoration(
  ///         gradient: AppConstants.sliverAppBarGradient,
  ///       ),
  ///     ),
  ///     ...
  ///   )
  static const LinearGradient sliverAppBarGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      sliverAppBarGradientStart,
      sliverAppBarGradientEnd,
    ],
  );

  // Spacing
  static const double paddingSmall = 10.0;
  static const double paddingMedium = 15.0;
  static const double paddingLarge = 20.0;
  static const double paddingExtraLarge = 32.0;

  // Border Radius
  static const double radiusSmall = 4.0;
  static const double radiusMedium = 8.0;
  static const double radiusLarge = 12.0;
  static const double radiusExtraLarge = 16.0;
  static const double radiusExtraExtraLarge = 20.0;
  static const double radiusFull = 100.0;

  // Font Sizes
  static const double fontSizeSmall = 12.0;
  static const double fontSizeMedium = 14.0;
  static const double fontSizeLarge = 16.0;
  static const double fontSizeExtraLarge = 18.0;
  static const double fontSizeHeading = 20.0;
  static const double fontSizeTitle = 24.0;

  // Icon Sizes
  static const double iconSizeSmall = 16.0;
  static const double iconSizeMedium = 24.0;
  static const double iconSizeLarge = 32.0;

  // App Strings
  static const String appName = 'TopMax Jobs';
  static const String otpLength = '6';
}

