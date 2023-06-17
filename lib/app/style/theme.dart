import 'package:flutter/material.dart';

final colorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromRGBO(45, 66, 185, 1),
  primary: const Color.fromRGBO(45, 66, 185, 1),
  secondary: const Color.fromRGBO(45, 66, 185, 1),
  background: const Color.fromARGB(31, 241, 241, 241),
  surface: const Color.fromARGB(31, 255, 255, 255),
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
      fontSize: 26,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    ),
    headlineMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    ),
    headlineSmall: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    ),
    titleLarge: TextStyle(
        fontSize: 19, fontWeight: FontWeight.bold, color: Colors.black87),
    titleMedium: TextStyle(
        fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black87),
    titleSmall: TextStyle(
        fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87),
    bodyLarge: TextStyle(fontSize: 19, color: Colors.black87),
    bodyMedium: TextStyle(fontSize: 17, color: Colors.black87),
    bodySmall: TextStyle(fontSize: 14, color: Colors.black87),
    displaySmall:
        TextStyle(fontSize: 11, color: Color.fromARGB(221, 56, 56, 56)),
  ),
  // 버튼 테마 스타일 설정
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      // 버튼 배경색 설정
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return colorScheme.primary.withOpacity(0.8); // 버튼이 눌렸을 때의 배경색
          } else if (states.contains(MaterialState.hovered)) {
            return colorScheme.primary.withOpacity(0.8); // 버튼에 마우스가 올려졌을 때의 배경색
          } else {
            return colorScheme.primary; // 기본 배경색 (colorScheme.primary 사용)
          }
        },
      ),
      // 버튼 텍스트 색상 설정
      foregroundColor: MaterialStateProperty.all(Colors.white),
      // 버튼 모양 설정
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // 원하는 radius 값을 지정
        ),
      ),
      elevation: MaterialStateProperty.all(5),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      // 버튼 배경색 설정
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.white70; // 버튼이 눌렸을 때의 배경색
          } else if (states.contains(MaterialState.hovered)) {
            return Colors.white70; // 버튼에 마우스가 올려졌을 때의 배경색
          } else {
            return Colors.white; // 기본 배경색 (colorScheme.primary 사용)
          }
        },
      ),
      // 버튼 텍스트 색상 설정
      foregroundColor: MaterialStateProperty.all(Colors.black87),
      // 버튼 모양 설정
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // 원하는 radius 값을 지정
        ),
      ),
      elevation: MaterialStateProperty.all(1.5),
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
    fillColor: MaterialStateColor.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return colorScheme.primary.withOpacity(0.8); // 선택된 상태의 색상
      } else {
        return colorScheme.primary; // 기본 색상
      }
    }),
    overlayColor: MaterialStateColor.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
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
