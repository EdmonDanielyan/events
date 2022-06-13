import 'package:flutter/material.dart';
import '../../components/cached_avatar/cached_avatar.dart';
import '../../model/user.dart';

class UsersPickerList extends StatefulWidget {
  final List<User> users;
  const UsersPickerList({Key? key, required this.users}) : super(key: key);

  @override
  State<UsersPickerList> createState() => _UsersPickerListState();
}

class _UsersPickerListState extends State<UsersPickerList> {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: Scrollbar(
        isAlwaysShown: true,
        controller: controller,
        child: ListView.builder(
          itemCount: widget.users.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          controller: controller,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: CachedCircleAvatar(
                url: widget.users[index].avatarUrl,
                name: widget.users[index].name,
                avatarHeight: 45,
                avatarWidth: 45,
              ),
            );
          },
        ),
      ),
    );
  }
}
