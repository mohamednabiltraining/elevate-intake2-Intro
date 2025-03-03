// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../api/datasourceimpl/brand/BrandsOnlineDatasourceImpl.dart' as _i6;
import '../api/datasourceimpl/categories/CategoriesOnlineDatasourceImpl.dart'
    as _i10;
import '../api/di.dart' as _i16;
import '../api/webServices/WebServices.dart' as _i4;
import '../data/datasourceContracts/brands_data_source.dart' as _i5;
import '../data/datasourceContracts/categories_data_source.dart' as _i9;
import '../data/respositories/brands/brands_repo.dart' as _i8;
import '../data/respositories/category/categories_repo.dart' as _i12;
import '../domain/contracts/category/brands_repo.dart' as _i7;
import '../domain/contracts/category/categories_repo.dart' as _i11;
import '../domain/usecase/get_brands_use_case.dart' as _i13;
import '../domain/usecase/get_categories_use_case.dart' as _i14;
import '../ui/home/HomeViewModel.dart' as _i15;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    gh.singleton<_i3.LogInterceptor>(() => dioModule.provideLogger());
    gh.singleton<_i3.Dio>(() => dioModule.provideDio(gh<_i3.LogInterceptor>()));
    gh.singleton<_i4.WebServices>(
        () => dioModule.provideWebServices(gh<_i3.Dio>()));
    gh.factory<_i5.BrandsOnlineDatasource>(
        () => _i6.BrandsOnlineDatasourceImpl(gh<_i4.WebServices>()));
    gh.factory<_i7.BrandsRepo>(
        () => _i8.BrandsRepoImpl(gh<_i5.BrandsOnlineDatasource>()));
    gh.factory<_i9.CategoriesOnlineDataSource>(
        () => _i10.CategoriesOnlineDataSourceImpl(gh<_i4.WebServices>()));
    gh.factory<_i11.CategoriesRepo>(
        () => _i12.CategoriesRepoImpl(gh<_i9.CategoriesOnlineDataSource>()));
    gh.factory<_i13.GetBrandsUseCase>(
        () => _i13.GetBrandsUseCase(gh<_i7.BrandsRepo>()));
    gh.factory<_i14.GetCategoriesUseCase>(
        () => _i14.GetCategoriesUseCase(gh<_i11.CategoriesRepo>()));
    gh.factory<_i15.HomeViewModel>(() => _i15.HomeViewModel(
          gh<_i14.GetCategoriesUseCase>(),
          gh<_i13.GetBrandsUseCase>(),
        ));
    return this;
  }
}

class _$DioModule extends _i16.DioModule {}
