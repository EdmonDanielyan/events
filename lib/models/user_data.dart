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

  UserProfileData({
    required this.id,
    this.lastName,
    this.name,
    this.workPosition,
    this.pathToAvatar,
    this.votes,
    this.awards,
    this.contacts,
    this.basicInformation,
    required this.canBeThanked
  });

  static UserProfileData getUserFromResponse(Map userData)
  {
    return UserProfileData(
      id: userData['id'] ?? 0,
      lastName: userData['last_name'],
      name: userData['name'],
      workPosition: userData['work_position'],
      pathToAvatar: userData['avatar'],
      votes: userData['barrels'] != null ? UserVotes.getUserVotesFromMap(userData['barrels']) : null,
      awards: userData['awards'] != null ? UserAwards.getUserAwardsFromMap(userData['awards']) : null,
      contacts: userData['contacts'] != null ? UserContacts.getUserContactsFromMap(userData['contacts']) : null,
      basicInformation: userData['basic_information'] != null ? UserBasicInfo.getUserBasicInfoFromMap(userData['basic_information']) : null,
      canBeThanked: userData['canBeThanked']
    );
  }

}

class UserVotes {
  int barrels;
  int reservoir;
  int tankers;

  UserVotes({
    this.barrels = 0,
    this.reservoir = 0,
    this.tankers = 0
  });

  static UserVotes getUserVotesFromMap(Map userVotesMap) {
    UserVotes userVotes = new UserVotes();

    userVotes.barrels = userVotesMap['barrels'];
    userVotes.reservoir = userVotesMap['reservoir'];
    userVotes.tankers = userVotesMap['tankers'];

    return userVotes;
  }

}

class UserAwards {
  bool goldenTanker;
  bool goldenTanker2019;
  bool team;

  UserAwards({
    this.goldenTanker = false,
    this.goldenTanker2019 = false,
    this.team = false
  });

  static UserAwards getUserAwardsFromMap(Map userAwardsMap) {
    return new UserAwards(
      goldenTanker: userAwardsMap['gold_tanker'] ?? false,
      goldenTanker2019: userAwardsMap['gold_tanker_2019'] ?? false,
      team: userAwardsMap['team'] ?? false
    );
  }

}

class UserContacts {
  String? workPhone;
  String? workMobilePhone;
  String? mobilePhone;
  String? email;

  UserContacts({
    this.workPhone,
    this.workMobilePhone,
    this.mobilePhone,
    this.email
  });

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
  String? address;
  String? office;
  String? birthday;

  UserBasicInfo({
    this.organization,
    this.address,
    this.office,
    this.birthday
  });

  static UserBasicInfo getUserBasicInfoFromMap(Map userBasicInfoMap) {
   return new UserBasicInfo(
      organization: userBasicInfoMap['organization'],
      address: userBasicInfoMap['address'],
      office: userBasicInfoMap['office'],
      birthday: userBasicInfoMap['birthday']
    );
  }

}