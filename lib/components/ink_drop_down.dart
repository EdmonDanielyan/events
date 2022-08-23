import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';

class InkDropDown extends StatefulWidget {
  final List<String> items;
  final void Function(int value) onChanged;
  final int? selectedIndex;
  final String hint;

  InkDropDown(
      {Key? key,
      required this.items,
      required this.onChanged,
      required this.selectedIndex,
      required this.hint})
      : super(key: key);

  @override
  _InkDropDownState createState() => _InkDropDownState();
}

class _InkDropDownState extends State<InkDropDown> {
  late int? selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showSelectorDialog();
      },
      child: DropdownButtonFormField<int>(
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.black,
        ),
        hint: IntrinsicWidth(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(),
            child: Text(
              selectedIndex != null
                  ? widget.items[selectedIndex!]
                  : widget.hint,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.black, fontSize: 17),
            ),
          ),
        ),
        decoration: InputDecoration(border: OutlineInputBorder()),
        style: const TextStyle(color: Colors.deepPurple),
        items: [],
        onChanged: (value) => widget.onChanged(value!),
      ),
    );
  }

  Future<void> showSelectorDialog() async {
    int? selected = await showDialog(
        context: context,
        builder: (context) {
          return SelectDialog(
            items: widget.items,
            selectedIndex: selectedIndex,
          );
        });
    if (selected != null) {
      setState(() {
        selectedIndex = selected;
      });
      widget.onChanged(selected);
    }
  }
}

class SelectDialog extends StatefulWidget {
  const SelectDialog({
    Key? key,
    required this.items,
    this.selectedIndex,
  }) : super(key: key);

  final List<String> items;
  final int? selectedIndex;

  @override
  _SelectDialogState createState() => _SelectDialogState();
}

class _SelectDialogState extends State<SelectDialog> {
  int? selectedItem;
  late AppLocalizations _strings;

  @override
  Widget build(BuildContext context) {
    _strings = localizationInstance;

    if (selectedItem == null) {
      selectedItem = widget.selectedIndex;
    }

    return AlertDialog(
      contentPadding: EdgeInsets.all(0),
      content: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height,
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, index) => Divider(
              thickness: 2,
              height: 2,
            ),
            itemCount: widget.items.length,
            itemBuilder: (context, index) {
              return RadioListTile<int>(
                activeColor: Color(0xff2b5e4a),
                controlAffinity: ListTileControlAffinity.trailing,
                title: Text(
                  widget.items[index],
                  style: TextStyle(
                      fontSize:
                          SizeConfig(context, 11).getProportionateScreenHeight),
                ),
                value: index,
                groupValue: selectedItem,
                onChanged: (int? value) {
                  setState(() {
                    selectedItem = value;
                  });
                },
              );
            },
          ),
        ),
      ),
      actions: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                  child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    _strings.back,
                    style: TextStyle(
                        fontSize: SizeConfig(context, 14)
                            .getProportionateScreenHeight,
                        color: Colors.grey),
                  ),
                ),
              )),
              Expanded(
                  child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop(selectedItem);
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    _strings.choose,
                    style: TextStyle(
                        fontSize: SizeConfig(context, 14)
                            .getProportionateScreenHeight,
                        color: Color(0xFF2B5E4A)),
                  ),
                ),
              )),
            ],
          ),
        )
      ],
    );
  }
}
