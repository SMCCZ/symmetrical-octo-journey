import 'package:flutter_test/flutter_test.dart';
import 'package:symmetrical_octo_journey/services/imp/user_service.dart';

void main() {
  test("get user", () async {
    var data = await getUser();
    print(data?.id);
  });
}
