class SocketEvents {
  static String get invite => "/invite";
  static String get message => "/message";
  static String get directMessage => "/directMessage";
  static String get addParticipant => "/addParticipant";
  static String get removeParticipant => "/removeParticipant";
  static String get deleteMessage => "/deleteMessage";
  static String get updateMessage => "/updateMessage";
  static String get updateChat => "/updateChat";
  static String get readMessage => "/readMessage";
  static String get online => "/online";

  static String inviteListener(int userId) => "/invite$userId";
  static String messageListener(int chatId) => "/message$chatId";
  static String directMessageListener(int userId) => "/directMessage$userId";
  static String removeParticipantListener(int chatId) =>
      "/removeParticipant$chatId";
  static String addParticipantListener(int chatId) => "/addParticipant$chatId";
  static String deleteMessageListener(int chatId) => "/deleteMessage$chatId";
  static String updateMessageListener(int chatId) => "/updateMessage$chatId";
  static String updateChatListener(int chatId) => "/updateChat$chatId";
  static String readMessageListener(int chatId) => "/readMessage$chatId";
  static String onlineListener(int userId) => "/online$userId";
}
