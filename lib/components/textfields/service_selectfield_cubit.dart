import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/core/cubit/selectfield/selectfield_cubit.dart';
import 'package:ink_mobile/core/cubit/selectfield/selectfield_state.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';
import 'package:ink_mobile/localization/strings/language.dart';
import 'package:ink_mobile/models/selectfield.dart';
import 'package:multi_select_flutter/dialog/mult_select_dialog.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

class ServiceSelectFieldCubit extends StatelessWidget {
  final SelectfieldCubit cubit;
  final String hint;
  final List<Selectfield> items;
  final Widget? onSelectItemWidget;
  final Widget Function(Selectfield, bool)? subWidget;
  final String? Function(String?)? validator;
  final void Function(List<Selectfield>) onChanged;
  const ServiceSelectFieldCubit({
    Key? key,
    required this.cubit,
    this.hint = "",
    this.onSelectItemWidget,
    this.subWidget,
    this.validator,
    required this.items,
    required this.onChanged,
  }) : super(key: key);
  static late LanguageStrings _strings;

  void showModalOptions(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (ctx) {
        return _listSelectors();
      },
    );
  }

  void onConfirm(List<dynamic> items) {
    cubit.setMode(AutovalidateMode.always);
    List<Selectfield> selectedItems = items.cast<Selectfield>();
    cubit.setItems(selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    _strings = BlocProvider.of<LocalizationCubit>(context, listen: true).state;
    return InkWell(
      onTap: () => showModalOptions(context),
      child: IgnorePointer(
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            _textfieldWidget(),
            _listContainer(context, _size),
          ],
        ),
      ),
    );
  }

  List<MultiSelectItem<Selectfield>> getList() {
    return items.map((e) => MultiSelectItem(e, e.title)).toList();
  }

  Widget _listSelectors() {
    return BlocBuilder<SelectfieldCubit, SelectfieldCubitState>(
      bloc: cubit,
      builder: (BuildContext context, state) {
        return MultiSelectDialog(
          items: getList(),
          onConfirm: onConfirm,
          initialValue: state.items,
          searchable: false,
          title: SizedBox(),
          controlAffinity: ListTileControlAffinity.trailing,
          subWidget: subWidget,
          cancelText: Text(
            _strings.back,
            style: TextStyle(color: Colors.grey[600]),
          ),
          confirmText: Text(
            _strings.select,
            style: TextStyle(
              color: Colors.green,
            ),
          ),
        );
      },
    );
  }

  Widget _textfieldWidget() {
    return BlocConsumer<SelectfieldCubit, SelectfieldCubitState>(
      bloc: cubit,
      listener: (BuildContext context, state) {
        onChanged(state.items);
      },
      builder: (BuildContext context, state) {
        return TextFormField(
          autovalidateMode: state.validateMode,
          validator: validator,
          decoration: InputDecoration(
            hintText: state.items.length < 1 ? hint : "",
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
            ),
            suffixIcon: Icon(
              Icons.keyboard_arrow_down,
              color: Colors.grey,
            ),
          ),
        );
      },
    );
  }

  Widget _listContainer(BuildContext context, Size size) {
    return Container(
      width: size.width,
      padding: const EdgeInsets.only(right: 40.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: BlocBuilder<SelectfieldCubit, SelectfieldCubitState>(
          bloc: cubit,
          builder: (BuildContext context, state) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                state.items.length,
                (index) => _selectedContainer(
                    context, state.items[index].title, index),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _selectedContainer(BuildContext context, String name, int index) {
    int maxElements = 3;
    if (index + 1 > maxElements) {
      return SizedBox();
    } else if (index + 1 > maxElements - 1) {
      name = "...";
    }

    return Container(
      margin: const EdgeInsets.only(
        left: 10.0,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(color: Theme.of(context).primaryColor),
      ),
      child: Text(
        name.length > 10 ? name.substring(0, 10) + '...' : name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
