import 'package:elevate_intake2_intro/StringUtils.dart';
import 'package:flutter_test/flutter_test.dart';

// test driven development

void main() {
  // description -> test scenario
  // happy scenario
  group("extractFirstName tests", () {
    test(
      "when call extractFirstName with correct full name"
      " then it returns first part",
      () {
        // arrange
        String fullName = "Mohamed Nabil";
        // act
        String result = extractFirstName(fullName);
        // assert
        expect(result, (equals("Mohamed")));
      },
    );

    test(
      "when call extractFirstName with onePart fullname"
      " then it returns same fullName",
      () {
        // arrange
        String fullName = "Mohamed";
        // act
        String result = extractFirstName(fullName);
        // assert
        expect(result, (equals("Mohamed")));
      },
    );
    test(
      "when call extractFirstName with empty fullName"
      " then it returns empty String",
      () {
        // arrange
        String fullName = "";
        // act
        String result = extractFirstName(fullName);
        // assert
        expect(result, (equals("")));
      },
    );
    test(
      "when call extractFirstName with null fullName"
      " then it returns empty String",
      () {
        // arrange
        String? fullName;
        // act
        String result = extractFirstName(fullName);
        // assert
        expect(result, (equals("")));
      },
    );
  });

  group("extractLastName tests", () {
    test("when call extractLastName with two parts fullName "
        "then it returns last part", () {
      // arrange
      String fullName = "Mohamed Nabil";
      // act
      String result = extractSecondName(fullName);
      // assert
      expect(result, (equals("Nabil")));
    },);
    test("when call extractLastName with one part fullName "
        "then it returns empty string", () {
      // arrange
      String fullName = "Nabil";
      // act
      String result = extractSecondName(fullName);
      // assert
      expect(result, (equals("")));
    },);
    test("when call extractLastName with null fullName "
        "then it returns empty string", () {
      // arrange
      String? fullName ;
      // act
      String result = extractSecondName(fullName);
      // assert
      expect(result, (equals("")));
    },);
    test("when call extractLastName with empty fullName "
        "then it returns empty string", () {
      // arrange
      String fullName ="";
      // act
      String result = extractSecondName(fullName);
      // assert
      expect(result, (equals("")));
    },);
  },);
}
// pre-production
// github action
// pre-push git-hook

// mock