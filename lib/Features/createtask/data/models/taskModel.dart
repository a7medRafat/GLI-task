class TaskModel {
  String? title;
  String? description;
  String? status;

  TaskModel({required this.title, required this.description,required this.status});

  TaskModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'status': status,
    };
  }
}
