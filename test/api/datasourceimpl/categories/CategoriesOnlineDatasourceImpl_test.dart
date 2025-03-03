import 'package:elevate_intake2_intro/api/datasourceimpl/categories/CategoriesOnlineDatasourceImpl.dart';
import 'package:elevate_intake2_intro/api/model/response/category/CategoriesResponse.dart';
import 'package:elevate_intake2_intro/api/model/response/category/Category_dto.dart';
import 'package:elevate_intake2_intro/data/datasourceContracts/categories_data_source.dart';
import 'package:elevate_intake2_intro/domain/common/Result.dart';
import 'package:elevate_intake2_intro/domain/model/category.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:elevate_intake2_intro/api/webServices/WebServices.dart';
import 'package:mockito/mockito.dart';

import 'CategoriesOnlineDatasourceImpl_test.mocks.dart';


@GenerateMocks([WebServices])
void main() {
  group("categories datasource", () {
    late CategoriesOnlineDataSource dataSource;
    late WebServices webServices;
    var categoriesResponse = CategoriesResponse(
        data: [CategoryDto(
            id: "1",
            name: "cat1",
            image: "image1"
        ),
          CategoryDto(
              id: "2",
              name: "cat2",
              image: "image2"
          ),
          CategoryDto(
              id: "3",
              name: "cat3",
              image: "image3"
          ),
        ]
    );
    setUp(() {
      webServices = MockWebServices();
      dataSource = CategoriesOnlineDataSourceImpl(webServices);
    },);

    test('when call getCategories then'
        'it should call getCategories from webServices '
        'and return correct output', ()async{

      when(webServices.getCategories()).thenAnswer((_)async => categoriesResponse,);

      var actual = await dataSource.getCategories() as Success<List<Category>>;

      verify(webServices.getCategories()).called(1);

      expect(actual.data?.length, categoriesResponse.data?.length);
    });

  },);
}