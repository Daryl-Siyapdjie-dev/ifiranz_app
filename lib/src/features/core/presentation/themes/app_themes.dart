import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppThemes {
  static TextTheme lightTextTheme = TextTheme(
    bodyLarge: GoogleFonts.poppins(
      color: AppColors.blackColor,
      fontWeight: FontWeight.w500,
      fontSize: 14,
    ),
    titleMedium: GoogleFonts.quicksand(
      color: AppColors.blackColor,
      fontWeight: FontWeight.w700,
      fontSize: 24,
    ),
    bodyMedium: GoogleFonts.poppins(
      color: AppColors.greyDark,
      fontWeight: FontWeight.w500,
      fontSize: 14,
    ),
    bodySmall: GoogleFonts.poppins(
      color: AppColors.greyDark,
      fontWeight: FontWeight.w500,
      fontSize: 12,
    ),
    displayLarge: GoogleFonts.poppins(
      color: AppColors.blackColor,
      fontSize: 32,
      fontWeight: FontWeight.w700,
    ),
    displayMedium: GoogleFonts.poppins(
      color: AppColors.blackColor,
      fontSize: 21,
      fontWeight: FontWeight.w700,
    ),
    displaySmall: GoogleFonts.poppins(
      color: AppColors.blackColor,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    headlineLarge: GoogleFonts.poppins(
      color: AppColors.blackColor,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
    headlineMedium: GoogleFonts.poppins(
      color: AppColors.blackColor,
      fontWeight: FontWeight.w600,
      fontSize: 14,
    ),
    titleLarge: GoogleFonts.poppins(
      color: AppColors.blackColor,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
  );

  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      cardColor: AppColors.whiteColor,
      scaffoldBackgroundColor: AppColors.whiteColor,
      primaryColor: AppColors.primaryColor,
      canvasColor: AppColors.whiteColor,
      textSelectionTheme: const TextSelectionThemeData(
        selectionColor: AppColors.primaryColor,
        selectionHandleColor: AppColors.primaryColor,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.whiteColor,
      ),
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateColor.resolveWith(
          (states) => AppColors.whiteColor,
        ),
        fillColor: MaterialStateColor.resolveWith(
          (states) => AppColors.primaryColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      appBarTheme: const AppBarTheme(
        foregroundColor: AppColors.blackColor,
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        centerTitle: true,
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return AppColors
                .primaryColor; // Change the background color when selected
          }
          return AppColors
              .greyLight; // Change the background color when not selected
        }),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.whiteColor,
          textStyle: GoogleFonts.poppins(
            color: AppColors.whiteColor,
            fontSize: 15.5,
            fontWeight: FontWeight.w600,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 18,
          ),
          minimumSize: const Size.fromHeight(0),
          elevation: 0,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.greyLight,
          side: const BorderSide(
            width: 1,
            color: AppColors.greyLight,
          ),
          textStyle: GoogleFonts.poppins(
            color: AppColors.greyLight,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 18,
          ),
          minimumSize: const Size.fromHeight(0),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: AppColors.transparent,
          foregroundColor: AppColors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: GoogleFonts.poppins(
            color: AppColors.primaryColor,
            fontSize: 15.5,
            fontWeight: FontWeight.w600,
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 18,
          ),
          minimumSize: const Size.fromHeight(0),
        ),
      ),
      dialogTheme: DialogTheme(
        backgroundColor: AppColors.whiteColor,
        titleTextStyle: GoogleFonts.poppins(
          color: AppColors.primaryColor,
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
        contentTextStyle: GoogleFonts.poppins(
          color: AppColors.primaryColor,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: Colors.grey.shade200,
        space: .6,
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 18,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          gapPadding: 12,
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          gapPadding: 12,
          borderSide: const BorderSide(
            width: 1,
            color: AppColors.transparent,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          gapPadding: 12,
          borderSide: const BorderSide(
            width: 0,
            color: AppColors.errorColor,
          ),
        ),
        errorStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          letterSpacing: .2,
          fontSize: 12,
        ),
        fillColor: const Color(0xFFF1EFEF),
        filled: true,
        iconColor: const Color(0xFF9E9E9E),
        hintStyle: GoogleFonts.poppins(
          color: const Color(0xFF949494),
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: AppColors.secondaryColor,
        primary: AppColors.primaryColor,
        error: AppColors.errorColor,
        onError: AppColors.whiteColor,
      ),
      textTheme: lightTextTheme,
    );
  }
}
