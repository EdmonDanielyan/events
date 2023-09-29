import 'package:ink_mobile/localization/i18n/i18n.dart';

import 'delivery_list.dart';

enum ReferencesType {
  employmentRecord,
  laborActivity,
  employmentCenter,
  visa,
  income,
  // sickLeave,
  income2ndfl,
  childAllowance,
  childAllowanceOneAndHalfYears,
  fifo,
  workAtCompany,
  averageEarnings,
  payrollAccount,
  fundsWithholding,
}

class ReferencesList {
  ReferencesList();

  ReferencesItem employmentRecord() => ReferencesItem(
      title: localizationInstance.refEmploymentRecord,
      referencesType: 'employment_record',
      deliveryList: [
        DeliveryType.OK_UK,
        DeliveryType.OK_IRK,
        DeliveryType.INKTKRS,
        DeliveryType.POST
      ],
      fields: ReferencesField());

  ReferencesItem laborActivity() => ReferencesItem(
      title: localizationInstance.refLaborActivity,
      referencesType: 'labor_activity',
      deliveryList: [
        DeliveryType.OK_UK,
        DeliveryType.OK_IRK,
        DeliveryType.INKTKRS,
        DeliveryType.POST
      ],
      fields: ReferencesField());

  ReferencesItem employmentCenter() => ReferencesItem(
      title: localizationInstance.refEmploymentCenter,
      referencesType: 'employment_center',
      deliveryList: [DeliveryType.BUH, DeliveryType.POST, DeliveryType.EMAIL],
      fields: ReferencesField(quantity: true),
      description: localizationInstance.productionTimeReferInfo);
  ReferencesItem visa() => ReferencesItem(
      title: localizationInstance.refVisa,
      referencesType: 'visa',
      deliveryList: [
        DeliveryType.OK_UK,
        DeliveryType.OK_IRK,
        DeliveryType.INKTKRS,
        DeliveryType.POST
      ],
      fields: ReferencesField());

  ReferencesItem income() => ReferencesItem(
        title: localizationInstance.refIncome,
        referencesType: 'income',
        deliveryList: [DeliveryType.BUH, DeliveryType.POST, DeliveryType.EMAIL],
        fields: ReferencesField(period: true, toProvideIn: true),
        description: localizationInstance.productionTimeReferInfo,
      );
  ReferencesItem income2ndfl() => ReferencesItem(
        title: localizationInstance.refIncome2ndfl,
        referencesType: 'income_2ndfl',
        deliveryList: [DeliveryType.BUH, DeliveryType.POST, DeliveryType.EMAIL],
        fields:
            ReferencesField(period: true, toProvideIn: true, quantity: true),
        description: localizationInstance.productionTimeReferInfo,
      );

  ReferencesItem childAllowance() => ReferencesItem(
        title: localizationInstance.refChildAllowance,
        referencesType: 'child_allowance',
        deliveryList: [
          DeliveryType.OK_UK,
          DeliveryType.OK_IRK,
          DeliveryType.INKTKRS,
          DeliveryType.POST
        ],
        fields: ReferencesField(fioChildren: true, files: true),
        description: localizationInstance.childAllowanceInfo,
      );
  ReferencesItem childAllowanceOneAndHalfYears() => ReferencesItem(
        title: localizationInstance.refChildAllowance1HalfYears,
        referencesType: 'child_allowance_1.5_years',
        deliveryList: [
          DeliveryType.OK_UK,
          DeliveryType.OK_IRK,
          DeliveryType.INKTKRS,
          DeliveryType.POST
        ],
        fields: ReferencesField(fioChildren: true, files: true),
        description: localizationInstance.childAllowanceInfo,
      );
  ReferencesItem fifo() => ReferencesItem(
      title: localizationInstance.refFifo,
      referencesType: 'FIFO',
      deliveryList: [
        DeliveryType.OK_UK,
        DeliveryType.OK_IRK,
        DeliveryType.INKTKRS,
        DeliveryType.POST
      ],
      fields: ReferencesField(periodFrom: true, periodTo: true));
  // ReferencesItem sickLeave() => ReferencesItem(
  //     title: localizationInstance.refSickLeave,
  //     referencesType: 'sick_leave',
  //     deliveryList: [DeliveryType.BUH, DeliveryType.INKTKRS, DeliveryType.POST],
  //     fields: ReferencesField(quantity: true));

  ReferencesItem workAtCompany() => ReferencesItem(
      title: localizationInstance.refWorkAtCompany,
      referencesType: 'work_at_company',
      deliveryList: [
        DeliveryType.OK_UK,
        DeliveryType.OK_IRK,
        DeliveryType.INKTKRS,
        DeliveryType.POST
      ],
      fields: ReferencesField());
  ReferencesItem averageEarnings() => ReferencesItem(
        title: localizationInstance.refAverageEarnings,
        referencesType: 'average_earnings',
        deliveryList: [DeliveryType.BUH, DeliveryType.POST, DeliveryType.EMAIL],
        fields:
            ReferencesField(period: true, toProvideIn: true, quantity: true),
        description: localizationInstance.productionTimeReferInfo,
      );
  ReferencesItem payrollAccount() => ReferencesItem(
        title: localizationInstance.refPayrollAccount,
        referencesType: 'payroll_account',
        deliveryList: [DeliveryType.BUH, DeliveryType.POST, DeliveryType.EMAIL],
        fields:
            ReferencesField(period: true, toProvideIn: true, quantity: true),
        description: localizationInstance.productionTimeReferInfo,
      );
  ReferencesItem fundsWithholding() => ReferencesItem(
        title: localizationInstance.refFundsWithholding,
        referencesType: 'funds_withholding',
        deliveryList: [DeliveryType.BUH, DeliveryType.POST, DeliveryType.EMAIL],
        fields:
            ReferencesField(period: true, toProvideIn: true, quantity: true),
        description: localizationInstance.productionTimeReferInfo,
      );

  ReferencesItem? getReferencesItem(ReferencesType type) {
    switch (type) {
      case ReferencesType.employmentRecord:
        return employmentRecord();
      case ReferencesType.laborActivity:
        return laborActivity();
      case ReferencesType.employmentCenter:
        return employmentCenter();
      case ReferencesType.visa:
        return visa();
      case ReferencesType.income:
        return income();
      case ReferencesType.income2ndfl:
        return income2ndfl();
      case ReferencesType.childAllowance:
        return childAllowance();
      case ReferencesType.childAllowanceOneAndHalfYears:
        return childAllowanceOneAndHalfYears();
      case ReferencesType.fifo:
        return fifo();
      // case ReferencesType.sickLeave:
      //   return sickLeave();
      case ReferencesType.workAtCompany:
        return workAtCompany();
      case ReferencesType.averageEarnings:
        return averageEarnings();
      case ReferencesType.payrollAccount:
        return payrollAccount();
      case ReferencesType.fundsWithholding:
        return fundsWithholding();
      default:
        return null;
    }
  }

  List<String> getListTitles() {
    List<String> items = [];
    ReferencesType.values.forEach((element) {
      String name = getReferencesItem(element)?.title ?? 'NaN';
      items.add(name);
    });

    return items;
  }

  ReferencesItem? getReferenceItemByInt(int? referencesType) {
    if (referencesType == null) return null;

    return getReferencesItem(ReferencesType.values[referencesType]);
  }
}

class ReferencesItem {
  String title;
  String referencesType;
  List<DeliveryType> deliveryList;
  ReferencesField fields;
  String description;

  ReferencesItem(
      {required this.title,
      required this.referencesType,
      required this.deliveryList,
      required this.fields,
      this.description = ""});
}

class ReferencesField {
  bool fio;
  bool fioChildren;
  bool position;
  bool department;
  bool phone;
  bool delivery;
  bool quantity;
  bool toProvideIn;
  bool period;
  bool periodFrom;
  bool periodTo;
  bool files;

  ReferencesField({
    this.fio = true,
    this.fioChildren = false,
    this.position = true,
    this.department = true,
    this.phone = true,
    this.delivery = true,
    this.quantity = false,
    this.toProvideIn = false,
    this.period = false,
    this.periodFrom = false,
    this.periodTo = false,
    this.files = false,
  });
}
