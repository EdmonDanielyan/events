import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/components/grouped_list/group_list.dart';
import 'package:ink_mobile/messenger/components/grouped_list/grouped_container.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class GroupedList<T, K> extends StatefulWidget {
  final List<T> items;
  final Widget Function(BuildContext, int) itemBuilder;
  final bool reverse;
  final K Function(T) groupBy;
  final Widget Function(T)? header;
  final ItemScrollController? controller;
  final ItemPositionsListener? itemPositionsListener;
  const GroupedList({
    Key? key,
    required this.items,
    required this.itemBuilder,
    this.reverse = false,
    required this.groupBy,
    this.header,
    this.controller,
    this.itemPositionsListener,
  }) : super(key: key);

  @override
  State<GroupedList<T, K>> createState() => _GroupedListState<T, K>();
}

class _GroupedListState<T, K> extends State<GroupedList<T, K>> {
  final groupList = GroupList<K>(items: [], keys: []);

  T? getNext(int index) {
    if (widget.reverse) {
      return widget.items.length > index + 1 ? widget.items[index + 1] : null;
    }

    return index > 0 ? widget.items[index + 1] : null;
  }

  @override
  Widget build(BuildContext context) {
    return ScrollablePositionedList.builder(
      itemScrollController: widget.controller,
      itemPositionsListener: widget.itemPositionsListener,
      itemCount: widget.items.length,
      reverse: widget.reverse,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final next = getNext(index);
        final _currentGroup = widget.groupBy(widget.items[index]);

        if (next != null && widget.header != null) {
          final _nextGroup = widget.groupBy(next);

          if (widget.reverse && _currentGroup != _nextGroup) {
            return GroupedContainer(
              children: [
                widget.header!(widget.items[index]),
                widget.itemBuilder(context, index),
              ],
            );
          }
        } else if (widget.header != null) {
          return GroupedContainer(
            children: [
              widget.header!(widget.items[index]),
              widget.itemBuilder(context, index),
            ],
          );
        }

        return widget.itemBuilder(context, index);
      },
    );
  }
}
