// ============================================================
// food_providers.dart  (Presentation layer)
// Dependency Injection - DataSource -> Repository -> UseCase
// ============================================================
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasources/food_local_datasource.dart';
import '../../data/repositories/food_repository_impl.dart';
import '../../domain/repositories/food_repository.dart';
import '../../domain/usecases/add_food_usecase.dart';
import '../../domain/usecases/delete_food_usecase.dart';
import '../../domain/usecases/get_foods_usecase.dart';

final foodLocalDataSourceProvider = Provider<FoodLocalDataSource>(
  (ref) => FoodLocalDataSource(),
);

final foodRepositoryProvider = Provider<FoodRepository>(
  (ref) => FoodRepositoryImpl(ref.watch(foodLocalDataSourceProvider)),
);

final getFoodsUseCaseProvider = Provider<GetFoodsUseCase>(
  (ref) => GetFoodsUseCase(ref.watch(foodRepositoryProvider)),
);

final addFoodUseCaseProvider = Provider<AddFoodUseCase>(
  (ref) => AddFoodUseCase(ref.watch(foodRepositoryProvider)),
);

final deleteFoodUseCaseProvider = Provider<DeleteFoodUseCase>(
  (ref) => DeleteFoodUseCase(ref.watch(foodRepositoryProvider)),
);
