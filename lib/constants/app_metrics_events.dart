import 'package:appmetrica_plugin/appmetrica_plugin.dart';

class AppMetricsEvents {
  void messageEvent() => _sendAnalytics("вход пользователя в раздел «Сообщения»");
  void searchEvent() => _sendAnalytics("вход пользователя в раздел «Поиск»");
  void newsEvent() => _sendAnalytics("вход пользователя в раздел «Новости»");
  void profileEvent() => _sendAnalytics("вход пользователя в раздел «Личный кабинет»");
  void eventsEvent() => _sendAnalytics("вход пользователя в раздел «События»");
  void announcementsEvent() => _sendAnalytics("вход пользователя в раздел «Объявления»");
  void feedbackEvent() => _sendAnalytics("вход пользователя в раздел «Обратная связь»");
  void referencesEvent() => _sendAnalytics("вход пользователя в раздел «Заказ справок»");
  void medicalInsuranceEvent() => _sendAnalytics("вход пользователя в раздел «Оформление ДМС»");
  void socialPackageEvent() => _sendAnalytics("вход пользователя в раздел «Социальный пакет»");
  void personnelMovementsEvent() => _sendAnalytics("вход пользователя в раздел «Кадровые перемещения»");
  void birthdaysEvent() => _sendAnalytics("вход пользователя в раздел «Дни рождения»");

  void _sendAnalytics(String event) => AppMetrica.reportEvent(event);
}