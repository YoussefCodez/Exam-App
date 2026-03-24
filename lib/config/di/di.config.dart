// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
<<<<<<< HEAD
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/sign_up/api/data_sources/signup_data_sources_remote_impl.dart'
    as _i678;
import '../../features/sign_up/api/api_client/signup_api_client.dart'
    as _i272;
import '../../features/sign_up/data/data_sources/signup_data_sources_remote_contract.dart'
    as _i485;
import '../../features/sign_up/data/repo/signup_repo_impl.dart' as _i821;
import '../../features/sign_up/domain/repo/signup_repo_contract.dart' as _i339;
import '../../features/sign_up/domain/use_cases/signup_use_case.dart' as _i254;
import '../../features/sign_up/presentation/view_model/cubit/signup_view_model.dart'
    as _i774;
import '../dio/dio_module.dart' as _i977;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.lazySingleton<_i361.Dio>(() => dioModule.dio());
    gh.factory<_i272.SignupApiClient>(
      () => _i272.SignupApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i485.SignupDataSourcesRemoteContract>(
      () => _i678.SignupDataSourcesRemoteImpl(gh<_i272.SignupApiClient>()),
    );
    gh.factory<_i339.SignupRepoContract>(
      () => _i821.SignupRepoImpl(gh<_i485.SignupDataSourcesRemoteContract>()),
    );
    gh.factory<_i254.SignupUseCase>(
      () => _i254.SignupUseCase(gh<_i339.SignupRepoContract>()),
    );
    gh.factory<_i774.SignupViewModel>(
      () => _i774.SignupViewModel(gh<_i254.SignupUseCase>()),
=======
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/login/api/data_sources/login_api_client.dart' as _i519;
import '../../features/login/api/data_sources/login_data_source_remote_impl.dart'
    as _i593;
import '../../features/login/data/repositories/login_data_source_remote_contract.dart'
    as _i804;
import '../../features/login/data/repositories/login_repo_impl.dart' as _i546;
import '../../features/login/domain/repositories/login_repo_contract.dart'
    as _i961;
import '../../features/login/domain/use_cases/login_use_case.dart' as _i191;
import '../../features/login/presentation/view_models/cubits/login_cubit.dart'
    as _i753;
import 'di_module.dart' as _i211;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final diModule = _$DiModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => diModule.sharedPrefs,
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => diModule.dio);
    gh.lazySingleton<_i558.FlutterSecureStorage>(() => diModule.secureStorage);
    gh.factory<_i519.LoginApiClient>(
      () => _i519.LoginApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i804.LoginDataSourceRemoteContract>(
      () => _i593.LoginDataSourceRemoteImpl(gh<_i519.LoginApiClient>()),
    );
    gh.factory<_i961.LoginRepoContract>(
      () => _i546.LoginRepoImpl(
        loginDataSourceRemote: gh<_i804.LoginDataSourceRemoteContract>(),
      ),
    );
    gh.factory<_i191.LoginUseCase>(
      () => _i191.LoginUseCase(gh<_i961.LoginRepoContract>()),
    );
    gh.factory<_i753.LoginCubit>(
      () => _i753.LoginCubit(
        gh<_i191.LoginUseCase>(),
        gh<_i558.FlutterSecureStorage>(),
        gh<_i460.SharedPreferences>(),
      ),
>>>>>>> origin/feature-login
    );
    return this;
  }
}

<<<<<<< HEAD
class _$DioModule extends _i977.DioModule {}
=======
class _$DiModule extends _i211.DiModule {}
>>>>>>> origin/feature-login
