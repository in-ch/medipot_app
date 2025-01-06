import 'package:flutter/material.dart';

final colorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromRGBO(45, 66, 185, 1),
  primary: const Color.fromRGBO(45, 66, 185, 1),
  secondary: const Color.fromRGBO(45, 66, 185, 1),
  background: const Color.fromARGB(31, 241, 241, 241),
  surface: const Color.fromARGB(31, 255, 255, 255),
  tertiary: const Color.fromARGB(255, 136, 136, 136),
);

final appTheme = ThemeData(
  // AppBar 스타일
  appBarTheme: const AppBarTheme(
    shadowColor: Colors.black45,
    elevation: 1,
    centerTitle: false,
  ),
  // 텍스트 스타일 설정
  colorScheme: colorScheme,
  textTheme: const TextTheme(
      headlineLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
          fontFamily: 'PretendardSemiBold'),
      headlineMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
          fontFamily: 'PretendardSemiBold'),
      headlineSmall: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
          fontFamily: 'PretendardSemiBold'),
      titleLarge: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.w900,
          color: Color.fromARGB(255, 10, 10, 10),
          fontFamily: 'PretendardBold'),
      titleMedium: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w300,
          color: Color.fromARGB(255, 50, 50, 50),
          fontFamily: 'PretendardSemiBold'),
      titleSmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w300,
          color: Color.fromARGB(255, 100, 100, 100),
          fontFamily: 'PretendardSemiBold'),
      bodyLarge: TextStyle(
          fontSize: 17, color: Colors.black87, fontFamily: 'PretendardRegular'),
      bodyMedium: TextStyle(
          fontSize: 15, color: Colors.black87, fontFamily: 'PretendardRegular'),
      bodySmall: TextStyle(
          fontSize: 12,
          color: Colors.black87,
          height: 1.5,
          fontFamily: 'PretendardRegular'),
      displayMedium: TextStyle(
          fontSize: 14,
          color: Color.fromARGB(221, 56, 56, 56),
          fontFamily: 'PretendardRegular'),
      displaySmall: TextStyle(
          fontSize: 11,
          color: Color.fromARGB(221, 56, 56, 56),
          fontFamily: 'PretendardRegular'),
      labelMedium: TextStyle(
          fontSize: 14,
          color: Color.fromARGB(221, 56, 56, 56),
          fontWeight: FontWeight.w600,
          fontFamily: 'PretendardRegular')),
  // 버튼 테마 스타일 설정
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      // 버튼 배경색 설정
      backgroundColor: WidgetStateProperty.resolveWith<Color>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.pressed)) {
            return colorScheme.primary.withValues(alpha: 0.8); // 버튼이 눌렸을 때의 배경색
          } else if (states.contains(WidgetState.hovered)) {
            return colorScheme.primary
                .withValues(alpha: 0.8); // 버튼에 마우스가 올려졌을 때의 배경색
          } else {
            return colorScheme.primary; // 기본 배경색 (colorScheme.primary 사용)
          }
        },
      ),
      // 버튼 텍스트 색상 설정
      foregroundColor: WidgetStateProperty.all(Colors.white),
      // 버튼 모양 설정
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // 원하는 radius 값을 지정
        ),
      ),
      elevation: WidgetStateProperty.all(5),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      // 버튼 배경색 설정
      backgroundColor: WidgetStateProperty.resolveWith<Color>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.pressed)) {
            return Colors.white70; // 버튼이 눌렸을 때의 배경색
          } else if (states.contains(WidgetState.hovered)) {
            return Colors.white70; // 버튼에 마우스가 올려졌을 때의 배경색
          } else {
            return Colors.white; // 기본 배경색 (colorScheme.primary 사용)
          }
        },
      ),
      // 버튼 텍스트 색상 설정
      foregroundColor: WidgetStateProperty.all(Colors.black87),
      // 버튼 모양 설정
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // 원하는 radius 값을 지정
        ),
      ),
      elevation: WidgetStateProperty.all(1.5),
    ),
  ),

  // TextField 스타일 설정
  inputDecorationTheme: InputDecorationTheme(
    filled: false,
    border: OutlineInputBorder(
      borderSide: BorderSide.none, // 테두리 없음
      borderRadius: BorderRadius.circular(10.0),
    ),
    fillColor: Colors.white,
    hintStyle: const TextStyle(
      color: Colors.grey,
    ),
  ),
  // Checkbox 테마 스타일 설정
  checkboxTheme: CheckboxThemeData(
    fillColor: WidgetStateColor.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return colorScheme.primary.withValues(alpha: 0.8); // 선택된 상태의 색상
      } else {
        return colorScheme.primary; // 기본 색상
      }
    }),
    overlayColor: WidgetStateColor.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.transparent; // 선택된 상태일 때 overlay 없음
      } else {
        return colorScheme.primary; // 선택되지 않은 상태일 때 overlay 색상
      }
    }),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(3.0), // 원하는 radius 값을 지정
    ),
  ),
  // tab 탭 스타일 설정
  tabBarTheme: TabBarTheme(
    unselectedLabelColor: Colors.black45,
    labelColor: colorScheme.primary,
    labelStyle: const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16,
    ),
    indicatorSize: TabBarIndicatorSize.tab,
    indicatorColor: colorScheme.primary,
  ),
);
