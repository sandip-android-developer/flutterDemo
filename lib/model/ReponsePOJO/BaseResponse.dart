class LoginResponse {
    String msg;
    String status;
    List<ResponseData> responseData;

    LoginResponse({this.msg, this.status, this.responseData});

    LoginResponse.fromJson(Map<String, dynamic> json) {
        msg = json['msg'];
        status = json['status'];
        if (json['response_data'] != null) {
            responseData = new List<ResponseData>();
            json['response_data'].forEach((v) {
                responseData.add(new ResponseData.fromJson(v));
            });
        }
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['msg'] = this.msg;
        data['status'] = this.status;
        if (this.responseData != null) {
            data['response_data'] = this.responseData.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class ResponseData {
    int id;
    String firstName;
    String lastName;
    String email;
    String mobileNumber;
    String password;
    String token;

    ResponseData(
        {this.id,
            this.firstName,
            this.lastName,
            this.email,
            this.mobileNumber,
            this.password,
            this.token});

    ResponseData.fromJson(Map<String, dynamic> json) {
        id = json['id'];
        firstName = json['first_name'];
        lastName = json['last_name'];
        email = json['email'];
        mobileNumber = json['mobile_number'];
        password = json['password'];
        token = json['token'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['first_name'] = this.firstName;
        data['last_name'] = this.lastName;
        data['email'] = this.email;
        data['mobile_number'] = this.mobileNumber;
        data['password'] = this.password;
        data['token'] = this.token;
        return data;
    }
}
