// ignore_for_file: constant_identifier_names

List<String> departmentList = [
  Department.INTERN.name,
  Department.OS.name,
  Department.NS.name,
  Department.PS.name,
  Department.CS.name,
  Department.OBGY.name,
  Department.UR.name,
  Department.OPH.name,
  Department.DT.name,
  Department.PD.name,
  Department.DM.name,
  Department.ENT.name,
  Department.IM.name,
  Department.C.name,
  Department.CM.name,
  Department.ED.name,
  Department.GI.name,
  Department.RH.name,
  Department.A.name,
  Department.HO.name,
  Department.CV.name,
  Department.NEP.name,
  Department.IF.name,
  Department.NR.name,
  Department.PSY.name,
  Department.CP.name,
  Department.RD.name,
  Department.DR.name,
  Department.ANE.name,
  Department.OM.name,
  Department.RM.name,
  Department.FM.name,
  Department.EM.name,
  Department.MS.name,
  Department.HM.name,
  Department.ICU.name,
  Department.OR.name,
  Department.ER.name,
  Department.NONE.name,
  Department.HAN.name,
];

enum Department {
  GS,
  OS,
  NS,
  PS,
  CS,
  OBGY,
  UR,
  OPH,
  DT,
  PD,
  DM,
  ENT,
  IM,
  C,
  CM,
  ED,
  GI,
  RH,
  A,
  HO,
  CV,
  NEP,
  IF,
  NR,
  PSY,
  CP,
  RD,
  DR,
  ANE,
  OM,
  RM,
  FM,
  EM,
  MS,
  HM,
  ICU,
  OR,
  ER,
  NONE,
  INTERN,
  HAN,
}

extension DepartmentExtension on Department {
  String get searchName {
    switch (this) {
      case Department.INTERN:
        return '인턴';
      case Department.GS:
        return '외과';
      case Department.OS:
        return '정형외과';
      case Department.NS:
        return '신경';
      case Department.PS:
        return '성형';
      case Department.CS:
        return '외과';
      case Department.OBGY:
        return '산부';
      case Department.UR:
        return '비뇨';
      case Department.OPH:
        return '안과';
      case Department.DT:
        return '치과';
      case Department.PD:
        return '소아청소년';
      case Department.DM:
        return '성형';
      case Department.ENT:
        return '이비인';
      case Department.IM:
        return '내과';
      case Department.C:
        return '내과';
      case Department.CM:
        return '내과';
      case Department.ED:
        return '내과';
      case Department.GI:
        return '내과';
      case Department.RH:
        return '내과';
      case Department.A:
        return '내과';
      case Department.HO:
        return '내과';
      case Department.CV:
        return '내과';
      case Department.NEP:
        return '내과';
      case Department.IF:
        return '내과';
      case Department.NR:
        return '신경';
      case Department.PSY:
        return '정신건강';
      case Department.CP:
        return '병리';
      case Department.RD:
        return '방사선';
      case Department.DR:
        return '영상';
      case Department.ANE:
        return '마취통증';
      case Department.OM:
        return '병리';
      case Department.RM:
        return '외과';
      case Department.FM:
        return '내과';
      case Department.EM:
        return '응급';
      case Department.MS:
        return '내과';
      case Department.HM:
        return '내과';
      case Department.ICU:
        return '응급';
      case Department.OR:
        return '흉부';
      case Department.ER:
        return '응급';
      case Department.NONE:
        return '';
      case Department.HAN:
        return '한의원';
      default:
        return '';
    }
  }

  String get name {
    switch (this) {
      case Department.INTERN:
        return '인턴';
      case Department.GS:
        return '일반외과';
      case Department.OS:
        return '정형외과';
      case Department.NS:
        return '신경외과';
      case Department.PS:
        return '성형외과';
      case Department.CS:
        return '흉부외과';
      case Department.OBGY:
        return '산부인과';
      case Department.UR:
        return '비뇨기과';
      case Department.OPH:
        return '안과';
      case Department.DT:
        return '치과';
      case Department.PD:
        return '소아청소년과과';
      case Department.DM:
        return '피부과';
      case Department.ENT:
        return '이비인후과';
      case Department.IM:
        return '내과';
      case Department.C:
        return '순환기내과';
      case Department.CM:
        return '호흡기내과';
      case Department.ED:
        return '내분비내과';
      case Department.GI:
        return '소화기내과';
      case Department.RH:
        return '류머티스내과';
      case Department.A:
        return '알레르기내과';
      case Department.HO:
        return '혈액종양내과';
      case Department.CV:
        return '심장내과';
      case Department.NEP:
        return '신장내과';
      case Department.IF:
        return '감염내과';
      case Department.NR:
        return '신경과';
      case Department.PSY:
        return '정신건강의학과';
      case Department.CP:
        return '임상병리과';
      case Department.RD:
        return '방사선과';
      case Department.DR:
        return '영상진단의학과';
      case Department.ANE:
        return '마취통증의학과';
      case Department.OM:
        return '산업의학과';
      case Department.RM:
        return '재활의학과';
      case Department.FM:
        return '가정의학과';
      case Department.EM:
        return '응급의학과';
      case Department.MS:
        return '종합검진';
      case Department.HM:
        return '일반검진';
      case Department.ICU:
        return '중환자실';
      case Department.OR:
        return '수술실';
      case Department.ER:
        return '응급실';
      case Department.NONE:
        return '진료과 없음';
      case Department.HAN:
        return '한의원';
      default:
        return '';
    }
  }
}

Department getDepartmentFromString(String value) {
  Department department = Department.NONE; // 기본값으로 설정

  for (Department dept in Department.values) {
    if (dept.name == value) {
      department = dept;
      break;
    }
  }

  return department;
}
