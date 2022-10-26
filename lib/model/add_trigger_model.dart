class AddTriggerModel {
  TStatus? status;

  AddTriggerModel({this.status});

  AddTriggerModel.fromJson(Map<String, dynamic> json) {
    status =
    json['status'] != null ? new TStatus.fromJson(json['status']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    return data;
  }
}

class TStatus {
  bool? success;
  int? code;
  String? message;

  TStatus({this.success, this.code, this.message});

  TStatus.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['code'] = this.code;
    data['message'] = this.message;
    return data;
  }
}