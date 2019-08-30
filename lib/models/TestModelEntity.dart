class TestModelEntity {
	String hello;

	TestModelEntity({this.hello});

	TestModelEntity.fromJson(Map<String, dynamic> json) {
		hello = json['hello'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['hello'] = this.hello;
		return data;
	}
}
