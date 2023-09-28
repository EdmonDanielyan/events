import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:ink_mobile/constants/urls.dart';
import 'package:ink_mobile/cubit/boot/boot_cubit.dart';
import 'package:ink_mobile/cubit/main_page/video_links_service.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/messenger/providers/notifications.dart';
import 'package:ink_mobile/providers/package_info.dart';
import 'package:ink_mobile/providers/secure_storage.dart';

import 'setup.config.dart';
import 'utils/app_config.dart';

final getIt = GetIt.instance;

const unitTest = Environment("unitTest");
//todo: Раскомментировать на релизе
// const defaultScope = Environment.prod;
const defaultScope = Environment.prod;

late String currentEnv;

Future<String> readEnv() async {
  currentEnv = await SecureStorage().read("environment") ?? defaultScope;
  return currentEnv;
}

Future<void> writeEnv(String value) async {
  SecureStorage().write(key: "environment", value: value);
  currentEnv = value;
}

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<void> setup() async {
  bool isProd = currentEnv == Environment.prod;
  getIt.registerLazySingleton<AppConfig>(() => AppConfig(
        serverUrl: isProd ? UrlsConfig.prodUrl : UrlsConfig.debugUrl,
        wsUrl: isProd ? UrlsConfig.wsProdUrl : UrlsConfig.wsDebugUrl,
        wsPath: isProd ? UrlsConfig.wsProdPath : UrlsConfig.wsDebugPath,
        messengerApiUrl: isProd
            ? UrlsConfig.messengerApiUrls.first
            : UrlsConfig.messengerApiUrls.last,
      ));
  await $initGetIt(getIt, environment: currentEnv);
  setupI18n(getIt);

  await getIt<LocalNotificationsProvider>().load();

  getIt<BootCubit>()
    ..onStart = () async {
      return true;
    };
  await getIt<PackageInfoProvider>().load();
  getIt.registerSingleton<IVideoLinksService>(VideoLinksService());
}
