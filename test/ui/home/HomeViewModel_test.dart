import 'package:bloc_test/bloc_test.dart';
import 'package:elevate_intake2_intro/domain/common/Result.dart';
import 'package:elevate_intake2_intro/domain/model/Brand.dart';
import 'package:elevate_intake2_intro/domain/model/category.dart';
import 'package:elevate_intake2_intro/domain/usecase/get_brands_use_case.dart';
import 'package:elevate_intake2_intro/domain/usecase/get_categories_use_case.dart';
import 'package:elevate_intake2_intro/ui/home/HomeViewModel.dart';
import 'package:elevate_intake2_intro/ui/home/home_screen_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'HomeViewModel_test.mocks.dart';

@GenerateMocks([GetBrandsUseCase,GetCategoriesUseCase])
void main() {
  late HomeViewModel homeViewModel;
  late GetCategoriesUseCase getCategoriesUseCase;
  late GetBrandsUseCase getBrandsUseCase;
  List<Brand> brands = [
    Brand(id: "1", name: "brand1"),
    Brand(id: "2", name: "brand2"),
  ];
  List<Category> categories = [
    Category(id: "1", name: "category1"),
    Category(id: "2", name: "category2"),
  ];
  group("home view model test", () {
    setUpAll(() {

      getBrandsUseCase = MockGetBrandsUseCase();
      getCategoriesUseCase = MockGetCategoriesUseCase();

      Result<List<Brand>?> brandsResult = Success(brands);
      Result<List<Category>> categoriesResult = Success(categories);

      provideDummy<Result<List<Category>>>(categoriesResult);
      provideDummy<Result<List<Brand>?>>(brandsResult);

      when(getBrandsUseCase.invoke()).thenAnswer((_)async => brandsResult);
      when(getCategoriesUseCase.invoke()).thenAnswer((_)async => categoriesResult);

    },);
    setUp(() {
      homeViewModel = HomeViewModel(getCategoriesUseCase, getBrandsUseCase);
    },);
    blocTest<HomeViewModel, HomeScreenState>(
      'when call do intent with load home page intent it '
          'should load categories and brands and returns correct states',
      build: () => homeViewModel,
      act: (viewModel) {
        viewModel.doIntent(LoadHomePageIntent());
      },
      expect: () =>[
        HomeScreenState(
          status:Status.loading,
        ),
        HomeScreenState(
          status:Status.success,
          categories: categories
        ),
        HomeScreenState(
          status:Status.success,
          categories: categories,
          brands: brands
        ),
      ],

    );

    blocTest<HomeViewModel, HomeScreenState>(
      'when call do intent with cagegoryClicked intent it '
          'should emit state with correct route',
      build: () => homeViewModel,
      act: (viewModel) {
        viewModel.doIntent(CategoryClickIntent(Category(id: "1",name: "category1")));
      },
      expect: () =>[
        HomeScreenState(
          status: Status.loading, // initial state
          navigationRoute: "CategoryDetailsScreen"
        ),
      ],
    );
    blocTest<HomeViewModel, HomeScreenState>(
      'when call do intent with BrandClick intent it '
          'should emit state with correct route',
      build: () => homeViewModel,
      act: (viewModel) {
        viewModel.doIntent(BrandClickIntent(Brand(id: "1",name: "category1")));
      },
      expect: () =>[
        HomeScreenState(
          status: Status.loading, // initial state
          navigationRoute: "BrandDetailsScreen"
        ),
      ],
    );

  },);

}