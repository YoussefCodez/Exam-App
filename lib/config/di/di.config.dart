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

import '../../features/login/api/api_client/login_api_client.dart' as _i395;
import '../../features/login/api/data_sources/login_data_source_remote_impl.dart'
    as _i593;
import '../../features/login/data/repo/login_data_source_remote_contract.dart'
    as _i358;
import '../../features/login/data/repo/login_repo_impl.dart' as _i176;
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
    final dioModule = _$DioModule();
    final secureStorageModule = _$SecureStorageModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPreferencesModule.sharedPrefs,
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => dioModule.dio());
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => secureStorageModule.secureStorage,
    );
    gh.lazySingleton<_i395.LoginApiClient>(
      () => _i395.LoginApiClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i711.ForgotPasswordApiClient>(
      () => _i711.ForgotPasswordApiClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i6.SignupApiClient>(
      () => _i6.SignupApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i358.LoginDataSourceRemoteContract>(
      () => _i593.LoginDataSourceRemoteImpl(gh<_i395.LoginApiClient>()),
    );
    gh.factory<_i458.ForgotPasswordDataSourcesContract>(
      () => _i406.ForgotPasswordDataSourcesImpl(
        gh<_i711.ForgotPasswordApiClient>(),
      ),
    );
    gh.factory<_i485.SignupDataSourcesRemoteContract>(
      () => _i678.SignupDataSourcesRemoteImpl(gh<_i6.SignupApiClient>()),
    );
    gh.factory<_i339.SignupRepoContract>(
      () => _i821.SignupRepoImpl(gh<_i485.SignupDataSourcesRemoteContract>()),
    );
    gh.factory<_i961.LoginRepoContract>(
      () => _i176.LoginRepoImpl(
        loginDataSourceRemote: gh<_i358.LoginDataSourceRemoteContract>(),
      ),
    );
    gh.factory<_i546.ForgotPasswordRepoContract>(
      () => _i551.ForgotPasswordRepoImpl(
        gh<_i458.ForgotPasswordDataSourcesContract>(),
      ),
    );
    gh.factory<_i194.ForgotPasswordUseCase>(
      () => _i194.ForgotPasswordUseCase(gh<_i546.ForgotPasswordRepoContract>()),
    );
    gh.factory<_i191.LoginUseCase>(
      () => _i191.LoginUseCase(gh<_i961.LoginRepoContract>()),
    );
    gh.factory<_i254.SignupUseCase>(
      () => _i254.SignupUseCase(gh<_i339.SignupRepoContract>()),
    );
    gh.factory<_i851.ResetViewModel>(
      () => _i851.ResetViewModel(gh<_i194.ForgotPasswordUseCase>()),
    );
    gh.factory<_i753.LoginCubit>(
      () => _i753.LoginCubit(
        gh<_i191.LoginUseCase>(),
        gh<_i558.FlutterSecureStorage>(),
        gh<_i460.SharedPreferences>(),
      ),
    );
    gh.factory<_i774.SignupViewModel>(
      () => _i774.SignupViewModel(gh<_i254.SignupUseCase>()),
    );
    return this;
  }
}

class _$SharedPreferencesModule extends _i896.SharedPreferencesModule {}

class _$DioModule extends _i977.DioModule {}

class _$SecureStorageModule extends _i582.SecureStorageModule {}
