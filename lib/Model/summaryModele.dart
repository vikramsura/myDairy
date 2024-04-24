class SummaryModele {
  bool? success;
  int? status;
  String? message;
  SummaryModeleData? data;

  SummaryModele({this.success, this.status, this.message, this.data});

  SummaryModele.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new SummaryModeleData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class SummaryModeleData {
  List<Summary>? summary;
  OverallTotals? overallTotals;

  SummaryModeleData({this.summary, this.overallTotals});

  SummaryModeleData.fromJson(Map<String, dynamic> json) {
    if (json['summary'] != null) {
      summary = <Summary>[];
      json['summary'].forEach((v) {
        summary!.add(new Summary.fromJson(v));
      });
    }
    overallTotals = json['overall_totals'] != null
        ? new OverallTotals.fromJson(json['overall_totals'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.summary != null) {
      data['summary'] = this.summary!.map((v) => v.toJson()).toList();
    }
    if (this.overallTotals != null) {
      data['overall_totals'] = this.overallTotals!.toJson();
    }
    return data;
  }
}

class Summary {
  String? milkType;
  int? farmerCount;
  String? totalQuantity;
  String? avgFat;
  String? totalAmount;

  Summary(
      {this.milkType,
        this.farmerCount,
        this.totalQuantity,
        this.avgFat,
        this.totalAmount});

  Summary.fromJson(Map<String, dynamic> json) {
    milkType = json['milk_type'];
    farmerCount = json['farmer_count'];
    totalQuantity = json['total_quantity'];
    avgFat = json['avg_fat'];
    totalAmount = json['total_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['milk_type'] = this.milkType;
    data['farmer_count'] = this.farmerCount;
    data['total_quantity'] = this.totalQuantity;
    data['avg_fat'] = this.avgFat;
    data['total_amount'] = this.totalAmount;
    return data;
  }
}

class OverallTotals {
  var totalFarmer;
  var totalQuantity;
  var totalFatAvg;
  var totalAmount;

  OverallTotals(
      {this.totalFarmer,
        this.totalQuantity,
        this.totalFatAvg,
        this.totalAmount});

  OverallTotals.fromJson(Map<String, dynamic> json) {
    totalFarmer = json['total_farmer'];
    totalQuantity = json['total_quantity'];
    totalFatAvg = json['total_fat_avg'];
    totalAmount = json['total_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_farmer'] = this.totalFarmer;
    data['total_quantity'] = this.totalQuantity;
    data['total_fat_avg'] = this.totalFatAvg;
    data['total_amount'] = this.totalAmount;
    return data;
  }
}