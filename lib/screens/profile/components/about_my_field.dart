import 'package:flutter/material.dart';
import 'package:ink_mobile/components/textfields/service_btn.dart';
import 'package:ink_mobile/models/user_data.dart';
import 'package:ink_mobile/screens/profile/components/section_title.dart';

class AboutMyField extends StatefulWidget {
  final ScrollController scrollController;
  final UserProfileData user;

  const AboutMyField({
    Key? key,
    required this.user,
    required this.scrollController,
  }) : super(key: key);

  @override
  State<AboutMyField> createState() => _AboutMyFieldState();
}

class _AboutMyFieldState extends State<AboutMyField> {
  bool _isLoading = false;
  bool _isErorr = false;
  String text = "";
  TextEditingController _aboutMyFieldC = TextEditingController();

  @override
  void initState() {
    //_aboutMyFieldC.text = widget.user.aboutMy ?? '';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: Column(
        children: [
          SectionTitle(
            title: 'О себе',
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: Colors.grey.shade400, width: 0.5),
                  bottom: BorderSide(color: Colors.grey.shade400, width: 0.5),
                )),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
              child: TextField(
                controller: _aboutMyFieldC,
                textInputAction: TextInputAction.go,
                onChanged: (_) {
                  setState(() {
                    WidgetsBinding.instance.addPostFrameCallback((__) =>
                        widget.scrollController.animateTo(
                            widget.scrollController.position.maxScrollExtent,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeOut));
                  });
                },
                decoration: InputDecoration(
                    hintText: 'Расскажи немного о себе',
                    hintStyle:
                        TextStyle(color: Color.fromRGBO(153, 153, 153, 1)),
                    border: InputBorder.none,
                    isCollapsed: true,
                    suffixIcon: _aboutMyFieldC.text != ''
                        ? IconButton(
                            icon: Icon(Icons.close),
                            iconSize: 30,
                            onPressed: () {
                              setState(() {
                                _aboutMyFieldC.text = '';
                              });
                            },
                          )
                        : const SizedBox.shrink()),
                minLines: 1,
                maxLines: 10,
              ),
            ),
          ),
          _isLoading
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: CircularProgressIndicator(),
                )
              : const SizedBox.shrink(),
          //_aboutMyFieldC.text == (widget.user.aboutMy??'') ?
          _aboutMyFieldC.text == text
              ? const SizedBox.shrink()
              : Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: ServiceBtn(
                    txt: 'Сохранить',
                    onPressed: () {
                      setState(() {
                        _isLoading = true;
                      });
                      Future.delayed(Duration(seconds: 1), () {
                        if (!_isErorr)
                          setState(() {
                            text = _aboutMyFieldC.text;
                            _isLoading = false;
                          });
                      });

                      //userCubit.saveFAboutMy(value: _aboutMyFieldC.text);
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
