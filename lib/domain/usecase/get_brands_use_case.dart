import 'package:elevate_intake2_intro/domain/common/Result.dart';
import 'package:elevate_intake2_intro/domain/contracts/category/brands_repo.dart';
import 'package:elevate_intake2_intro/domain/contracts/category/categories_repo.dart';
import 'package:elevate_intake2_intro/domain/model/Brand.dart';
import 'package:elevate_intake2_intro/domain/model/category.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetBrandsUseCase{
  BrandsRepo brandsRepo;
  GetBrandsUseCase(this.brandsRepo);// 100% we have the right object
  Future<Result<List<Brand>?>> invoke(){
    return brandsRepo.getBrands();
  }
}