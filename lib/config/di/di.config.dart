// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../core/network/network_info.dart' as _i892;
import '../../features/exam/api/local_data_source/exam_local_data_source.dart'
    as _i628;
import '../../features/exam/api/remote_data_source/exam_api_client.dart'
    as _i304;
import '../../features/exam/data/repositories/get_all_questions_impl.dart'
    as _i303;
import '../../features/exam/domain/repositories/get_all_questions_contract.dart'
    as _i968;
import '../../features/exam/domain/use_cases/get_all_questions_use_case.dart'
    as _i728;
import '../../features/exam/presentation/view_models/cubits/get_all_questions_cubit.dart'
    as _i455;
import '../../features/explore/api/api_client/explore_api_client.dart'
    as _i1020;
import '../../features/explore/api/data_sources/explore_data_sources_impl.dart'
    as _i136;
import '../../features/explore/data/data_sources/explore_data_sources_contract.dart'
    as _i634;
import '../../features/explore/data/repo/explore_repo_impl.dart' as _i932;
import '../../features/explore/domain/repo/explore_repo_contract.dart' as _i135;
import '../../features/explore/domain/use_cases/get_subjects_use_case.dart'
    as _i593;
import '../../features/explore/presentation/view_model/cubit/explore_view_model.dart'
    as _i536;
import '../../features/login/api/local_data_source/login_local_data_source.dart'
    as _i880;
import '../../features/login/api/remote_data_sources/login_api_client.dart'
    as _i1036;
import '../../features/login/api/remote_data_sources/login_data_source_remote_impl.dart'
    as _i743;
import '../../features/login/data/repositories/login_data_source_remote_contract.dart'
    as _i804;
import '../../features/login/data/repositories/login_repo_impl.dart' as _i546;
import '../../features/login/domain/repositories/login_repo_contract.dart'
    as _i961;
import '../../features/login/domain/use_cases/login_use_case.dart' as _i191;
import '../../features/login/presentation/view_models/cubits/login_cubit.dart'
    as _i753;
import '../../features/reset_password/api/api_client/forgot_password_api_client.dart'
    as _i711;
import '../../features/reset_password/api/data_sources/forgot_password_data_sources_impl.dart'
    as _i406;
import '../../features/reset_password/data/data_sources/forgot_password_data_sources_contract.dart'
    as _i458;
import '../../features/reset_password/data/repo/forgot_password_repo_impl.dart'
    as _i551;
import '../../features/reset_password/domain/repo/forgot_password_repo_contract.dart'
    as _i546;
import '../../features/reset_password/domain/use_cases/forgot_password_use_case.dart'
    as _i194;
import '../../features/reset_password/presentation/view_model/cubit/reset_view_model.dart'
    as _i851;
import '../../features/sign_up/api/api_client/signup_api_client.dart' as _i6;
import '../../features/sign_up/api/data_sources/signup_data_sources_remote_impl.dart'
    as _i678;
import '../../features/sign_up/data/data_sources/signup_data_sources_remote_contract.dart'
    as _i485;
import '../../features/sign_up/data/repo/signup_repo_impl.dart' as _i821;
import '../../features/sign_up/domain/repo/signup_repo_contract.dart' as _i339;
import '../../features/sign_up/domain/use_cases/signup_use_case.dart' as _i254;
import '../../features/sign_up/presentation/view_model/cubit/signup_view_model.dart'
    as _i774;
import '../dio/dio_module.dart' as _i977;
import '../dio/token_interceptor.dart' as _i534;
import '../secure_storage/secure_storage_module.dart' as _i582;
import '../shared_preferences/shared_preferences_module.dart' as _i896;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final sharedPreferencesModule = _$SharedPreferencesModule();
    final secureStorageModule = _$SecureStorageModule();
    final dioModule = _$DioModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPreferencesModule.sharedPrefs,
      preResolve: true,
    );
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => secureStorageModule.secureStorage,
    );
    gh.factory<_i534.TokenInterceptor>(
      () => _i534.TokenInterceptor(gh<_i558.FlutterSecureStorage>()),
    );
    gh.factory<_i892.NetworkInfo>(() => _i892.NetworkInfoImpl());
    gh.lazySingleton<_i361.Dio>(
      () => dioModule.dio(gh<_i534.TokenInterceptor>()),
    );
    gh.factory<_i628.ExamLocalDataSource>(
      () => _i628.ExamLocalDataSourceImpl(),
    );
    gh.lazySingleton<_i1036.LoginApiClient>(
      () => _i1036.LoginApiClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i711.ForgotPasswordApiClient>(
      () => _i711.ForgotPasswordApiClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i6.SignupApiClient>(
      () => _i6.SignupApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i304.ExamApiClient>(() => _i304.ExamApiClient(gh<_i361.Dio>()));
    gh.factory<_i1020.ExploreApiClient>(
      () => _i1020.ExploreApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i804.LoginDataSourceRemoteContract>(
      () => _i743.LoginDataSourceRemoteImpl(gh<_i1036.LoginApiClient>()),
    );
    gh.factory<_i961.LoginRepoContract>(
      () => _i546.LoginRepoImpl(
        loginDataSourceRemote: gh<_i804.LoginDataSourceRemoteContract>(),
      ),
    );
    gh.factory<_i880.LoginLocalDataSource>(
      () => _i880.LoginLocalDataSourceImpl(gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i634.ExploreDataSourcesContract>(
      () => _i136.ExploreDataSourcesImpl(
        apiClient: gh<_i1020.ExploreApiClient>(),
        secureStorage: gh<_i558.FlutterSecureStorage>(),
      ),
    );
    gh.factory<_i968.GetAllQuestionsContract>(
      () => _i303.GetAllQuestionsImpl(
        examApiClient: gh<_i304.ExamApiClient>(),
        localDataSource: gh<_i628.ExamLocalDataSource>(),
        networkInfo: gh<_i892.NetworkInfo>(),
      ),
    );
    gh.factory<_i191.LoginUseCase>(
      () => _i191.LoginUseCase(gh<_i961.LoginRepoContract>()),
    );
    gh.factory<_i458.ForgotPasswordDataSourcesContract>(
      () => _i406.ForgotPasswordDataSourcesImpl(
        gh<_i711.ForgotPasswordApiClient>(),
      ),
    );
    gh.factory<_i728.GetAllQuestionsUseCase>(
      () => _i728.GetAllQuestionsUseCase(
        getAllQuestionsContract: gh<_i968.GetAllQuestionsContract>(),
      ),
    );
    gh.factory<_i485.SignupDataSourcesRemoteContract>(
      () => _i678.SignupDataSourcesRemoteImpl(gh<_i6.SignupApiClient>()),
    );
    gh.factory<_i135.ExploreRepoContract>(
      () => _i932.ExploreRepoImpl(gh<_i634.ExploreDataSourcesContract>()),
    );
    gh.factory<_i455.GetAllQuestionsCubit>(
      () => _i455.GetAllQuestionsCubit(
        getAllQuestionsUseCase: gh<_i728.GetAllQuestionsUseCase>(),
      ),
    );
    gh.factory<_i339.SignupRepoContract>(
      () => _i821.SignupRepoImpl(gh<_i485.SignupDataSourcesRemoteContract>()),
    );
    gh.factory<_i546.ForgotPasswordRepoContract>(
      () => _i551.ForgotPasswordRepoImpl(
        gh<_i458.ForgotPasswordDataSourcesContract>(),
      ),
    );
    gh.factory<_i753.LoginCubit>(
      () => _i753.LoginCubit(
        gh<_i191.LoginUseCase>(),
        gh<_i558.FlutterSecureStorage>(),
        gh<_i880.LoginLocalDataSource>(),
      ),
    );
    gh.factory<_i194.ForgotPasswordUseCase>(
      () => _i194.ForgotPasswordUseCase(gh<_i546.ForgotPasswordRepoContract>()),
    );
    gh.factory<_i254.SignupUseCase>(
      () => _i254.SignupUseCase(gh<_i339.SignupRepoContract>()),
    );
    gh.factory<_i593.GetSubjectsUseCase>(
      () => _i593.GetSubjectsUseCase(
        repoContract: gh<_i135.ExploreRepoContract>(),
      ),
    );
    gh.factory<_i851.ResetViewModel>(
      () => _i851.ResetViewModel(gh<_i194.ForgotPasswordUseCase>()),
    );
    gh.factory<_i536.ExploreViewModel>(
      () => _i536.ExploreViewModel(gh<_i593.GetSubjectsUseCase>()),
    );
    gh.factory<_i774.SignupViewModel>(
      () => _i774.SignupViewModel(gh<_i254.SignupUseCase>()),
    );
    return this;
  }
}

class _$SharedPreferencesModule extends _i896.SharedPreferencesModule {}

class _$SecureStorageModule extends _i582.SecureStorageModule {}

class _$DioModule extends _i977.DioModule {}
