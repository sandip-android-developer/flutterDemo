/*
class BaseModel<T> {
    String msg;
    String status;
    T responseData;

    BaseModel({this.msg, this.status, this.responseData});

    BaseModel.fromJson(Map<String, dynamic> json) {
        msg = json['msg'];
        status = json['status'];
        if (json['response_data'] != null) {
            responseData = responseData as T;
            json['response_data'].forEach((v) {
                responseData.add(responseData);
            });
        }
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['msg'] = this.msg;
        data['status'] = this.status;
        if (this.responseData != null) {
            data['response_data'] = T;
        }
        return data;
    }
}
*/
