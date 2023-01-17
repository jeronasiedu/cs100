import 'package:cs_100/app/features/resources/domain/entites/resource.dart';
import 'package:cs_100/shared/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class ResourcesRepository {
  Future<Either<Failure, List<Resource>>> getCourses(String year);
  Future<Either<Failure, List<Resource>>> getResources(String courseID);
}
