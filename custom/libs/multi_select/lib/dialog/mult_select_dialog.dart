// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';

import '../util/multi_select_actions.dart';
import '../util/multi_select_item.dart';
import '../util/multi_select_list_type.dart';

/// A dialog containing either a classic checkbox style list, or a chip style list.
class MultiSelectDialog<V> extends StatefulWidget with MultiSelectActions<V> {
  /// List of items to select from.
  final List<MultiSelectItem<V>> items;

  /// The list of selected values before interaction.
  final List<V>? initialValue;

  //The list of Action Widgets for AlertDialog
  final List<Widget>? actions;

  /// The text at the top of the dialog.
  final Widget? title;

  /// Fires when the an item is selected / unselected.
  final void Function(List<V>)? onSelectionChanged;

  /// Fires when the an item is selected / unselected.
  final void Function(V, bool)? onItemSelect;

  /// Fires when confirm is tapped.
  final void Function(List<V>)? onConfirm;

  /// Toggles search functionality.
  final bool? searchable;

  /// Text on the confirm button.
  final Text? confirmText;

  /// Text on the cancel button.
  final Text? cancelText;

  /// An enum that determines which type of list to render.
  final MultiSelectListType? listType;

  /// Sets the color of the checkbox or chip when it's selected.
  final Color? selectedColor;

  /// Sets a fixed height on the dialog.
  final double? height;

  /// Set the placeholder text of the search field.
  final String? searchHint;

  /// A function that sets the color of selected items based on their value.
  /// It will either set the chip color, or the checkbox color depending on the list type.
  final Color? Function(V)? colorator;

  /// The background color of the dialog.
  final Color? backgroundColor;

  /// The color of the chip body or checkbox border while not selected.
  final Color? unselectedColor;

  /// Icon button that shows the search field.
  final Icon? searchIcon;

  /// Icon button that hides the search field
  final Icon? closeSearchIcon;

  /// Style the text on the chips or list tiles.
  final TextStyle? itemsTextStyle;

  /// Style the text on the selected chips or list tiles.
  final TextStyle? selectedItemsTextStyle;

  /// Style the search text.
  final TextStyle? searchTextStyle;

  /// Style the search hint.
  final TextStyle? searchHintStyle;

  /// Set the color of the check in the checkbox
  final Color? checkColor;

  final ListTileControlAffinity controlAffinity;

  final Widget Function(V, bool)? subWidget;

  final double fontsize;

  MultiSelectDialog(
      {required this.items,
      required this.initialValue,
      this.title,
      this.onSelectionChanged,
      this.controlAffinity = ListTileControlAffinity.leading,
      this.onItemSelect,
      this.onConfirm,
      this.actions,
      this.subWidget,
      this.listType,
      this.searchable,
      this.confirmText,
      this.cancelText,
      this.selectedColor,
      this.searchHint,
      this.height,
      this.colorator,
      this.backgroundColor,
      this.unselectedColor,
      this.searchIcon,
      this.closeSearchIcon,
      this.itemsTextStyle,
      this.searchHintStyle,
      this.searchTextStyle,
      this.selectedItemsTextStyle,
      this.checkColor,
      required this.fontsize});

  @override
  State<StatefulWidget> createState() => _MultiSelectDialogState<V>(items);
}

class _MultiSelectDialogState<V> extends State<MultiSelectDialog<V>> {
  List<V> _selectedValues = [];
  bool _showSearch = false;
  List<MultiSelectItem<V>> _items;

  _MultiSelectDialogState(this._items);

  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      _selectedValues.addAll(widget.initialValue!);
    }
  }

  /// Returns a CheckboxListTile
  Widget _buildListItem(MultiSelectItem<V> item) {
    return Theme(
      data: ThemeData(
        unselectedWidgetColor: widget.unselectedColor ?? Colors.black54,
        accentColor: widget.selectedColor ?? Theme.of(context).primaryColor,
      ),
      child: Column(
        children: [
          CheckboxListTile(
            checkColor: widget.checkColor,
            value: _selectedValues.contains(item.value),
            activeColor: widget.colorator != null
                ? widget.colorator!(item.value) ?? widget.selectedColor
                : widget.selectedColor,
            title: Text(item.label,
                style: _selectedValues.contains(item.value)
                    ? TextStyle.lerp(
                        widget.selectedItemsTextStyle,
                        TextStyle(fontSize: widget.fontsize),
                        2,
                      )
                    : TextStyle.lerp(
                        widget.itemsTextStyle,
                        TextStyle(fontSize: widget.fontsize),
                        2,
                      )),
            controlAffinity: widget.controlAffinity,
            onChanged: (checked) {
              setState(() {
                _selectedValues = widget.onItemCheckedChange(
                    _selectedValues, item.value, checked!);
              });
              if (widget.onSelectionChanged != null) {
                widget.onSelectionChanged!(_selectedValues);
              }

              if (widget.onItemSelect != null) {
                widget.onItemSelect!(item.value, checked!);
              }
            },
          ),
          if (widget.subWidget != null) ...[
            widget.subWidget!(item.value, _selectedValues.contains(item.value))
          ],
        ],
      ),
    );
  }

  /// Returns a ChoiceChip
  Widget _buildChipItem(MultiSelectItem<V> item) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      child: ChoiceChip(
        backgroundColor: widget.unselectedColor,
        selectedColor:
            widget.colorator != null && widget.colorator!(item.value) != null
                ? widget.colorator!(item.value)
                : widget.selectedColor != null
                    ? widget.selectedColor
                    : Theme.of(context).primaryColor.withOpacity(0.35),
        label: Text(
          item.label,
          style: _selectedValues.contains(item.value)
              ? TextStyle(
                  color: widget.colorator != null &&
                          widget.colorator!(item.value) != null
                      ? widget.selectedItemsTextStyle != null
                          ? widget.selectedItemsTextStyle!.color ??
                              widget.colorator!(item.value)!.withOpacity(1)
                          : widget.colorator!(item.value)!.withOpacity(1)
                      : widget.selectedItemsTextStyle != null
                          ? widget.selectedItemsTextStyle!.color ??
                              (widget.selectedColor != null
                                  ? widget.selectedColor!.withOpacity(1)
                                  : Theme.of(context).primaryColor)
                          : widget.selectedColor != null
                              ? widget.selectedColor!.withOpacity(1)
                              : null,
                  fontSize: widget.selectedItemsTextStyle != null
                      ? widget.selectedItemsTextStyle!.fontSize
                      : null,
                )
              : widget.itemsTextStyle,
        ),
        selected: _selectedValues.contains(item.value),
        onSelected: (checked) {
          setState(() {
            _selectedValues = widget.onItemCheckedChange(
                _selectedValues, item.value, checked);
          });
          if (widget.onSelectionChanged != null) {
            widget.onSelectionChanged!(_selectedValues);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: widget.backgroundColor,
      title: widget.searchable == false
          ? widget.title ?? Text("Select")
          : Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _showSearch
                      ? Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextField(
                              style: widget.searchTextStyle,
                              decoration: InputDecoration(
                                hintStyle: widget.searchHintStyle,
                                hintText: widget.searchHint ?? "Search",
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: widget.selectedColor ??
                                        Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                              onChanged: (val) {
                                setState(() {
                                  _items = widget.updateSearchQuery(
                                      val, widget.items);
                                });
                              },
                            ),
                          ),
                        )
                      : widget.title ?? Text("Select"),
                  IconButton(
                    icon: _showSearch
                        ? widget.closeSearchIcon ?? Icon(Icons.close)
                        : widget.searchIcon ?? Icon(Icons.search),
                    onPressed: () {
                      setState(() {
                        _showSearch = !_showSearch;
                        if (!_showSearch) _items = widget.items;
                      });
                    },
                  ),
                ],
              ),
            ),
      contentPadding:
          widget.listType == null || widget.listType == MultiSelectListType.LIST
              ? const EdgeInsets.only(top: 0.0)
              : const EdgeInsets.all(20),
      content: Container(
        height: widget.height,
        width: MediaQuery.of(context).size.width * 0.8,
        child: widget.listType == null ||
                widget.listType == MultiSelectListType.LIST
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return _buildListItem(_items[index]);
                },
              )
            : SingleChildScrollView(
                child: Wrap(
                  children: _items.map(_buildChipItem).toList(),
                ),
              ),
      ),
      actions: widget.actions != null
          ? widget.actions
          : <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                        child: TextButton(
                      onPressed: () {
                        widget.onCancelTap(context, widget.initialValue!);
                      },
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: widget.cancelText ??
                            Text(
                              "CANCEL",
                              style: TextStyle(
                                color: (widget.selectedColor != null &&
                                        widget.selectedColor !=
                                            Colors.transparent)
                                    ? widget.selectedColor!.withOpacity(1)
                                    : Theme.of(context).primaryColor,
                              ),
                            ),
                      ),
                    )),
                    Expanded(
                        child: TextButton(
                      onPressed: () {
                        widget.onConfirmTap(
                            context, _selectedValues, widget.onConfirm);
                      },
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: widget.confirmText ??
                            Text(
                              'OK',
                              style: TextStyle(
                                color: (widget.selectedColor != null &&
                                        widget.selectedColor !=
                                            Colors.transparent)
                                    ? widget.selectedColor!.withOpacity(1)
                                    : Theme.of(context).primaryColor,
                              ),
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
