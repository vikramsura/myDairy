

import 'package:milkdairy/all_import.dart';

List<String> hardwarename(BuildContext context) {
  return [
    AppLocalizations.of(context)!.select,
    AppLocalizations.of(context)!.fATMACHINE,
    AppLocalizations.of(context)!.wEIGHINGSCALE,
    AppLocalizations.of(context)!.dISPLAYUNIT,
    AppLocalizations.of(context)!.tHERMALPRINTER,
    AppLocalizations.of(context)!.lRMACHINE,
    AppLocalizations.of(context)!.pRMACHINE,
  ];
}

Map<String, String> hardwareOutput(BuildContext context) {
  return {
    AppLocalizations.of(context)!.select: 'Select',
    AppLocalizations.of(context)!.fATMACHINE: 'FATMACHINE',
    AppLocalizations.of(context)!.wEIGHINGSCALE: 'WEIGHINGSCALE',
    AppLocalizations.of(context)!.dISPLAYUNIT: 'DISPLAYUNIT',
    AppLocalizations.of(context)!.tHERMALPRINTER: 'THERMALPRINTER',
    AppLocalizations.of(context)!.lRMACHINE: 'LRMACHINE',
    AppLocalizations.of(context)!.pRMACHINE: 'PRMACHINE',
  };
}
Map<String, String> hardwareInput(BuildContext context) {
  return {
    "Select": AppLocalizations.of(context)!.select,
    "FATMACHINE": AppLocalizations.of(context)!.fATMACHINE,
    "WEIGHINGSCALE": AppLocalizations.of(context)!.wEIGHINGSCALE,
    "DISPLAYUNIT": AppLocalizations.of(context)!.dISPLAYUNIT,
    "THERMALPRINTER": AppLocalizations.of(context)!.tHERMALPRINTER,
    "LRMACHINE": AppLocalizations.of(context)!.lRMACHINE,
    "PRMACHINE": AppLocalizations.of(context)!.pRMACHINE,
  };
}
List<String> shifts(BuildContext context) {
  return [
    AppLocalizations.of(context)!.select,
    AppLocalizations.of(context)!.morning,
    AppLocalizations.of(context)!.evening,

  ];
}

Map<String, String> shiftsOutput(BuildContext context) {
  return {
    AppLocalizations.of(context)!.select: 'Select',
    AppLocalizations.of(context)!.morning: 'Morning',
    AppLocalizations.of(context)!.evening: 'Evening',

  };
}
Map<String, String> shiftsInput(BuildContext context) {
  return {
    "Select": AppLocalizations.of(context)!.select,
    "Morning": AppLocalizations.of(context)!.morning,
    "Evening": AppLocalizations.of(context)!.evening,

  };
}


List<String> parity(BuildContext context) {
  return [
    AppLocalizations.of(context)!.select,
    AppLocalizations.of(context)!.odd,
    AppLocalizations.of(context)!.even,
  ];
}

Map<String, String> parityOutput(BuildContext context) {
  return {
    AppLocalizations.of(context)!.select: 'Select',
    AppLocalizations.of(context)!.odd: 'Odd',
    AppLocalizations.of(context)!.even: 'Even',

  };
}
Map<String, String> parityInput(BuildContext context) {
  return {
    "Select": AppLocalizations.of(context)!.select,
    "Odd": AppLocalizations.of(context)!.odd,
    "Even": AppLocalizations.of(context)!.even,

  };
}
List<String> fromShifts(BuildContext context) {
  return [
    AppLocalizations.of(context)!.select,
    AppLocalizations.of(context)!.morning,
    AppLocalizations.of(context)!.evening,
  ];
}

Map<String, String> fromShiftsOutput(BuildContext context) {
  return {
    AppLocalizations.of(context)!.select: 'Select',
    AppLocalizations.of(context)!.morning: 'Morning',
    AppLocalizations.of(context)!.evening: 'Evening',

  };
}
Map<String, String> fromShiftsInput(BuildContext context) {
  return {
    "Select": AppLocalizations.of(context)!.select,
    "Morning": AppLocalizations.of(context)!.morning,
    "Evening": AppLocalizations.of(context)!.evening,

  };
}
List<String> penaltyType(BuildContext context) {
  return [
    AppLocalizations.of(context)!.select,
    AppLocalizations.of(context)!.quantity,
    AppLocalizations.of(context)!.amount,
  ];
}

Map<String, String> penaltyTypeOutput(BuildContext context) {
  return {
    AppLocalizations.of(context)!.select: 'Select',
    AppLocalizations.of(context)!.quantity: 'Quantity',
    AppLocalizations.of(context)!.amount: 'Amount',

  };
}
Map<String, String> penaltyTypeInput(BuildContext context) {
  return {
    "Select": AppLocalizations.of(context)!.select,
    "Quantity": AppLocalizations.of(context)!.quantity,
    "Amount": AppLocalizations.of(context)!.amount,

  };
}

List<String> continuousStrList(BuildContext context) {
  return [
    AppLocalizations.of(context)!.no,
    AppLocalizations.of(context)!.yes,
  ];
}

List<String> flowControlList(BuildContext context) {
  return [
    AppLocalizations.of(context)!.no,
    AppLocalizations.of(context)!.yes,
  ];
}


Map<String, String> flowControlInput(BuildContext context) {
  return {
    "No": AppLocalizations.of(context)!.no,
    "Yes": AppLocalizations.of(context)!.yes,

  };
}
Map<String, String> flowControlOutput(BuildContext context) {
  return {
    AppLocalizations.of(context)!.no: 'No',
    AppLocalizations.of(context)!.yes: 'Yes',

  };
}

Map<String, String> continuousStrOutput(BuildContext context) {
  return {
    AppLocalizations.of(context)!.no: 'No',
    AppLocalizations.of(context)!.yes: 'Yes',

  };
}
Map<String, String> continuousStrInput(BuildContext context) {
  return {
    "No": AppLocalizations.of(context)!.no,
    "Yes": AppLocalizations.of(context)!.yes,

  };
}