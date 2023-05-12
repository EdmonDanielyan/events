import 'package:ink_mobile/models/absence.dart';

class UserProfileData {
  int id;
  String? lastName;
  String? name;
  String? workPosition;
  String? pathToAvatar;
  bool canBeThanked;
  UserVotes? votes;
  UserAwards? awards;
  UserContacts? contacts;
  UserBasicInfo? basicInformation;
  Absence? absence;
  String? shiftMan;

  UserProfileData(
      {required this.id,
      this.lastName,
      this.name,
      this.workPosition,
      this.pathToAvatar,
      this.votes,
      this.awards,
      this.contacts,
      this.basicInformation,
      this.absence,
      this.shiftMan,
      required this.canBeThanked});

  UserProfileData copyWith({
    int? id,
    String? lastName,
    String? name,
    String? workPosition,
    String? pathToAvatar,
    bool? canBeThanked,
    UserVotes? votes,
    UserAwards? awards,
    UserContacts? contacts,
    Absence? absence,
    String? shiftMan,
    UserBasicInfo? basicInformation,
  }) {
    return UserProfileData(
      id: id ?? this.id,
      lastName: lastName ?? this.lastName,
      name: name ?? this.name,
      workPosition: workPosition ?? this.workPosition,
      pathToAvatar: pathToAvatar ?? this.pathToAvatar,
      canBeThanked: canBeThanked ?? this.canBeThanked,
      votes: votes ?? this.votes,
      awards: awards ?? this.awards,
      contacts: contacts ?? this.contacts,
      absence: absence ?? this.absence,
      shiftMan: shiftMan ?? this.shiftMan,
      basicInformation: basicInformation ?? this.basicInformation,
    );
  }

  static UserProfileData getUserFromResponse(Map userData) {
    return UserProfileData(
      id: userData['id'] ?? 0,
      lastName: userData['last_name'],
      name: userData['name'],
      workPosition: userData['work_position'],
      pathToAvatar: userData['avatar'],
      votes: userData['barrels'] != null
          ? UserVotes.getUserVotesFromMap(userData['barrels'])
          : null,
      awards: userData['awards'] != null
          ? UserAwards.getUserAwardsFromMap(userData['awards'])
          : null,
      contacts: userData['contacts'] != null
          ? UserContacts.getUserContactsFromMap(userData['contacts'])
          : null,
      basicInformation: userData['basic_information'] != null
          ? UserBasicInfo.getUserBasicInfoFromMap(userData['basic_information'])
          : null,
      canBeThanked: userData['canBeThanked'],
      absence: userData['absence'] != null
          ? Absence.fromMap(userData['absence'])
          : null,
      shiftMan: userData['shift_man'],
    );
  }
}

class UserVotes {
  int barrels;
  int reservoir;
  int tankers;

  UserVotes({this.barrels = 0, this.reservoir = 0, this.tankers = 0});

  static UserVotes getUserVotesFromMap(Map userVotesMap) {
    UserVotes userVotes = new UserVotes();

    userVotes.barrels = userVotesMap['barrels'];
    userVotes.reservoir = userVotesMap['reservoir'];
    userVotes.tankers = userVotesMap['tankers'];

    return userVotes;
  }

  UserVotes copyWith({
    int? barrels,
    int? reservoir,
    int? tankers,
  }) {
    return UserVotes(
      barrels: barrels ?? this.barrels,
      reservoir: reservoir ?? this.reservoir,
      tankers: tankers ?? this.tankers,
    );
  }
}

class UserAwards {
  bool goldenTanker;
  bool goldenTanker2019;
  bool team;

  UserAwards(
      {this.goldenTanker = false,
      this.goldenTanker2019 = false,
      this.team = false});

  static UserAwards getUserAwardsFromMap(Map userAwardsMap) {
    return new UserAwards(
        goldenTanker: userAwardsMap['gold_tanker'] ?? false,
        goldenTanker2019: userAwardsMap['gold_tanker_2019'] ?? false,
        team: userAwardsMap['team'] ?? false);
  }
}

class UserContacts {
  String? workPhone;
  String? workMobilePhone;
  String? mobilePhone;
  String? email;

  UserContacts(
      {this.workPhone, this.workMobilePhone, this.mobilePhone, this.email});

  static UserContacts getUserContactsFromMap(Map userContactsMap) {
    return new UserContacts(
      workPhone: userContactsMap['work_phone'],
      workMobilePhone: userContactsMap['work_mobile_phone'],
      mobilePhone: userContactsMap['mobile_phone'],
      email: userContactsMap['email'],
    );
  }
}

class UserBasicInfo {
  String? organization;
  String? department;
  String? address;
  String? office;
  String? birthday;

  UserBasicInfo(
      {this.organization,
      this.department,
      this.address,
      this.office,
      this.birthday});

  static UserBasicInfo getUserBasicInfoFromMap(Map userBasicInfoMap) {
    return new UserBasicInfo(
        organization: userBasicInfoMap['organization'],
        department: userBasicInfoMap['department'],
        address: userBasicInfoMap['address'],
        office: userBasicInfoMap['office'],
        birthday: userBasicInfoMap['birthday']);
  }
}
