import 'package:flutter/material.dart';
import '../../components/cached_avatar/cached_avatar.dart';
import '../../model/user.dart';

class UsersPickerList extends StatefulWidget {
  final List<User> users;
  final void Function(User, bool) onSelect;
  const UsersPickerList({Key? key, required this.users, required this.onSelect})
      : super(key: key);

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
        thumbVisibility: true,
        controller: controller,
        child: ListView.builder(
          itemCount: widget.users.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          controller: controller,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  CachedCircleAvatar(
                    url: widget.users[index].avatarUrl,
                    name: widget.users[index].name,
                    avatarHeight: 45,
                    avatarWidth: 45,
                  ),
                  Positioned(
                    child: InkWell(
                      onTap: () {
                        widget.onSelect(widget.users[index], false);
                      },
                      child: Icon(
                        Icons.close,
                        size: 16.0,
                        color: Colors.black,
                      ),
                    ),
                    right: -10,
                    bottom: 10,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
