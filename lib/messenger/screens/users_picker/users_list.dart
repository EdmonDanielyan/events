import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';
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
      height: SizeConfig(context, 53).getProportionateScreenHeight,
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
              padding: const EdgeInsets.only(right: 5.0, bottom: 5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CachedCircleAvatar(
                    url: widget.users[index].avatarUrl,
                    name: widget.users[index].name,
                    avatarHeight:
                        SizeConfig(context, 40).getProportionateScreenHeight,
                    avatarWidth:
                        SizeConfig(context, 40).getProportionateScreenHeight,
                  ),
                  InkWell(
                    onTap: () {
                      widget.onSelect(widget.users[index], false);
                    },
                    child: Icon(
                      Icons.close,
                      size:
                          SizeConfig(context, 16).getProportionateScreenHeight,
                      color: Colors.black,
                    ),
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
