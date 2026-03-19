// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/reset_password/api/api_client/forgot_password_api_client.dart'
    as _i711;
import '../../features/reset_password/api/api_client/new_password_api_client.dart'
    as _i871;
import '../../features/reset_password/api/api_client/verify_reset_api_client.dart'
    as _i220;
import '../../features/reset_password/api/data_sources/forgot_password_data_sources_impl.dart'
    as _i406;
import '../../features/reset_password/api/data_sources/new_password_data_sources_impl.dart'
    as _i56;
import '../../features/reset_password/api/data_sources/verify_reset_data_sources_impl.dart'
    as _i463;
import '../../features/reset_password/data/data_sources/forgot_password_data_sources_contract.dart'
    as _i458;
import '../../features/reset_password/data/data_sources/new_password_data_sources_contract.dart'
    as _i888;
import '../../features/reset_password/data/data_sources/verify_reset_data_sources_contract.dart'
    as _i427;
import '../../features/reset_password/data/repo/forgot_password_repo_impl.dart'
    as _i551;
import '../../features/reset_password/data/repo/new_password_repo_impl.dart'
    as _i994;
import '../../features/reset_password/data/repo/verify_reset_repo_impl.dart'
    as _i738;
import '../../features/reset_password/domain/repo/forgot_password_repo_contract.dart'
    as _i546;
import '../../features/reset_password/domain/repo/new_password_repo_contract.dart'
    as _i57;
import '../../features/reset_password/domain/repo/verify_reset_repo_contract.dart'
    as _i883;
import '../../features/reset_password/domain/use_cases/forgot_password_use_case.dart'
    as _i194;
import '../../features/reset_password/domain/use_cases/new_password_use_case.dart'
    as _i169;
import '../../features/reset_password/domain/use_cases/verify_reset_use_case.dart'
    as _i373;
import '../../features/reset_password/presentation/view_model/cubit/reset_view_model.dart'
    as _i851;
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
    gh.factory<_i711.ForgotPasswordApiClient>(
      () => _i711.ForgotPasswordApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i871.NewPasswordApiClient>(
      () => _i871.NewPasswordApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i220.VerifyResetApiClient>(
      () => _i220.VerifyResetApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i888.NewPasswordDataSourcesContract>(
      () => _i56.NewPasswordDataSourcesImpl(gh<_i871.NewPasswordApiClient>()),
    );
    gh.factory<_i57.NewPasswordRepoContract>(
      () =>
          _i994.NewPasswordRepoImpl(gh<_i888.NewPasswordDataSourcesContract>()),
    );
    gh.factory<_i427.VerifyResetDataSourcesContract>(
      () => _i463.VerifyResetDataSourcesImpl(gh<_i220.VerifyResetApiClient>()),
    );
    gh.factory<_i458.ForgotPasswordDataSourcesContract>(
      () => _i406.ForgotPasswordDataSourcesImpl(
        gh<_i711.ForgotPasswordApiClient>(),
      ),
    );
    gh.factory<_i169.NewPasswordUseCase>(
      () => _i169.NewPasswordUseCase(gh<_i57.NewPasswordRepoContract>()),
    );
    gh.factory<_i883.VerifyResetRepoContract>(
      () =>
          _i738.VerifyResetRepoImpl(gh<_i427.VerifyResetDataSourcesContract>()),
    );
    gh.factory<_i373.VerifyResetUseCase>(
      () => _i373.VerifyResetUseCase(gh<_i883.VerifyResetRepoContract>()),
    );
    gh.factory<_i546.ForgotPasswordRepoContract>(
      () => _i551.ForgotPasswordRepoImpl(
        gh<_i458.ForgotPasswordDataSourcesContract>(),
      ),
    );
    gh.factory<_i194.ForgotPasswordUseCase>(
      () => _i194.ForgotPasswordUseCase(gh<_i546.ForgotPasswordRepoContract>()),
    );
    gh.factory<_i851.ResetViewModel>(
      () => _i851.ResetViewModel(
        gh<_i194.ForgotPasswordUseCase>(),
        gh<_i373.VerifyResetUseCase>(),
        gh<_i169.NewPasswordUseCase>(),
      ),
    );
    return this;
  }
}

class _$DioModule extends _i977.DioModule {}
