import 'package:elevate_intake2_intro/data/datasourceContracts/brands_data_source.dart';
import 'package:elevate_intake2_intro/domain/common/Result.dart';
import 'package:elevate_intake2_intro/domain/contracts/category/brands_repo.dart';
import 'package:elevate_intake2_intro/domain/model/Brand.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: BrandsRepo)
class BrandsRepoImpl implements BrandsRepo{
  BrandsOnlineDatasource _brandsOnlineDatasource;
  BrandsRepoImpl(this._brandsOnlineDatasource);
  @override
  Future<Result<List<Brand>?>> getBrands  () {
    return _brandsOnlineDatasource.getBrands();
    // Caching -> OnlineFirst => Api -> cache
    // offlineFirst -> offline -> online -> cache
  }


}