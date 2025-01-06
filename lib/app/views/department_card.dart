// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

enum UserDepartmentColor {
  FM,
  TB,
  IM,
  PED,
  NR,
  NP,
  RM,
  DER,
  UR,
  OBGY,
  PS,
  NS,
  EY,
  GS,
  ENT,
  OS,
  CS,
  AN,
  RO,
  DR,
  EM,
  OEM,
  LM,
  NM,
  NoDepartment,
}

class PopularCard extends StatelessWidget {
  final String? department;

  const PopularCard({super.key, this.department});

  Color getDepartmentColor(String? department) {
    switch (department) {
      case 'FM':
        return const Color(0xFFEF8B8B);
      case 'TB':
        return const Color(0xFFEDA1DF);
      case 'IM':
        return const Color(0xFFDAA1ED);
      case 'PED':
        return const Color(0xFFB688EA);
      case 'NR':
        return const Color(0xFF889DEA);
      case 'NP':
        return const Color(0xFF88C6EA);
      case 'RM':
        return const Color(0xFF88E7EA);
      case 'DER':
        return const Color(0xFF88EAD3);
      case 'UR':
        return const Color(0xFF91EA88);
      case 'OBGY':
        return const Color(0xFFB6EA88);
      case 'PS':
        return const Color(0xFFDDEA88);
      case 'NS':
        return const Color(0xFFEAD688);
      case 'EY':
        return const Color(0xFFEABF88);
      case 'GS':
        return const Color(0xFFEAA288);
      case 'ENT':
        return const Color(0xFF3953A4);
      case 'OS':
        return const Color(0xFFA9AFB2);
      case 'CS':
        return const Color(0xFF99EA3C);
      case 'AN':
        return const Color(0xFFB7B7B7);
      case 'RO':
        return const Color(0xFFA88EFF);
      case 'DR':
        return const Color(0xFF5691DD);
      case 'EM':
        return const Color(0xFFD4EF81);
      case 'OEM':
        return const Color(0xFFE5D472);
      case 'LM':
        return const Color(0xFF499596);
      case 'NM':
        return const Color(0xFF3DB7EF);
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8.0),
      decoration: BoxDecoration(
        color: getDepartmentColor(department),
        borderRadius: BorderRadius.circular(3.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 4, right: 4, top: 2, bottom: 2),
        child: Text(
          department ?? '',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10.0,
          ),
        ),
      ),
    );
  }
}
