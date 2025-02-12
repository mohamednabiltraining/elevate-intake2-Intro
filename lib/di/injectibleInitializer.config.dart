// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../api/datasourceimpl/brand/BrandsOnlineDatasourceImpl.dart' as _i989;
import '../api/datasourceimpl/categories/CategoriesOnlineDatasourceImpl.dart'
    as _i303;
import '../api/webServices/ApiClient.dart' as _i209;
import '../data/datasourceContracts/brands_data_source.dart' as _i118;
import '../data/datasourceContracts/categories_data_source.dart' as _i178;
import '../data/respositories/brands/brands_repo.dart' as _i653;
import '../data/respositories/category/categories_repo.dart' as _i984;
import '../domain/contracts/category/brands_repo.dart' as _i768;
import '../domain/contracts/category/categories_repo.dart' as _i1012;
import '../domain/usecase/get_brands_use_case.dart' as _i309;
import '../domain/usecase/get_categories_use_case.dart' as _i724;
import '../ui/home/HomeViewModel.dart' as _i123;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i209.ApiClient>(() => _i209.ApiClient());
    gh.factory<_i118.BrandsOnlineDatasource>(
        () => _i989.BrandsOnlineDatasourceImpl(gh<_i209.ApiClient>()));
    gh.factory<_i178.CategoriesOnlineDataSource>(
        () => _i303.CategoriesOnlineDataSourceImpl(gh<_i209.ApiClient>()));
    gh.factory<_i1012.CategoriesRepo>(
        () => _i984.CategoriesRepoImpl(gh<_i178.CategoriesOnlineDataSource>()));
    gh.factory<_i768.BrandsRepo>(
        () => _i653.BrandsRepoImpl(gh<_i118.BrandsOnlineDatasource>()));
    gh.factory<_i724.GetCategoriesUseCase>(
        () => _i724.GetCategoriesUseCase(gh<_i1012.CategoriesRepo>()));
    gh.factory<_i309.GetBrandsUseCase>(
        () => _i309.GetBrandsUseCase(gh<_i768.BrandsRepo>()));
    gh.factory<_i123.HomeViewModel>(() => _i123.HomeViewModel(
          gh<_i724.GetCategoriesUseCase>(),
          gh<_i309.GetBrandsUseCase>(),
        ));
    return this;
  }
}
