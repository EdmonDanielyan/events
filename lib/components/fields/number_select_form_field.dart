// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NumberSelectFormField extends FormField<String> {
  NumberSelectFormField({
    Key? key,
    required this.controller,
    this.mode = NumberSelectFieldMode.double,
    this.changeValueBy = 1,
    this.buttonsColor = const ButtonsColor(),
    this.flex,
    this.onlyPositive = false,
    this.leftButtonIcon,
    this.rightButtonIcon,
    this.height,
    this.width,
    this.min = 0,
    String? initialValue,
    FocusNode? focusNode,
    BoxDecoration? decoration,
    TextInputAction? textInputAction,
    TextStyle? style,
    StrutStyle? strutStyle,
    TextDirection? textDirection,
    TextAlign textAlign = TextAlign.center,
    TextAlignVertical textAlignVertical = TextAlignVertical.center,
    bool autofocus = false,
    bool readOnly = false,
    ToolbarOptions? toolbarOptions,
    bool? showCursor,
    @Deprecated(
      'Use autovalidateMode parameter which provide more specific '
      'behaviour related to auto validation. '
      'This feature was deprecated after v1.19.0.',
    )
        bool autovalidate = false,
    @Deprecated(
      'Use maxLengthEnforcement parameter which provides more specific '
      'behavior related to the maxLength limit. '
      'This feature was deprecated after v1.25.0-5.0.pre.',
    )
        bool maxLengthEnforced = true,
    MaxLengthEnforcement? maxLengthEnforcement,
    bool expands = false,
    int? maxLength,
    ValueChanged<String>? onChanged,
    GestureTapCallback? onTap,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onFieldSubmitted,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    List<TextInputFormatter>? inputFormatters,
    bool? enabled,
    double cursorWidth = 2.0,
    double? cursorHeight,
    Radius? cursorRadius,
    Color? cursorColor,
    Brightness? keyboardAppearance,
    bool enableInteractiveSelection = true,
    TextSelectionControls? selectionControls,
    InputCounterWidgetBuilder? buildCounter,
    AutovalidateMode? autovalidateMode,
  })  : assert(
          autovalidate == false ||
              autovalidate == true && autovalidateMode == null,
          'autovalidate and autovalidateMode should not be used together.',
        ),
        assert(
          maxLengthEnforced || maxLengthEnforcement == null,
          'maxLengthEnforced is deprecated, use only maxLengthEnforcement',
        ),
        assert(maxLength == null || maxLength > 0),
        assert(
            mode == NumberSelectFieldMode.int && changeValueBy is int ||
                mode == NumberSelectFieldMode.double,
            'changeValueBy type must match mode type'),
        super(
          key: key,
          initialValue: controller.text,
          onSaved: onSaved,
          validator: validator,
          enabled: enabled ?? true,
          autovalidateMode: autovalidate
              ? AutovalidateMode.always
              : (autovalidateMode ?? AutovalidateMode.disabled),
          builder: (FormFieldState<String> field) {
            final _NumberSelectFormFieldState state =
                field as _NumberSelectFormFieldState;

            BoxDecoration effectiveBoxDecor = decoration ??
                BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                );

            if (field.hasError) {
              effectiveBoxDecor = effectiveBoxDecor.copyWith(
                  border: Border.all(color: Colors.red));
            }

            void onChangedHandler(String value) {
              field.didChange(value);
              if (onChanged != null) {
                onChanged(value);
              }
            }

            List<TextInputFormatter> defaultInputFormatters = [];

            if (inputFormatters == null) {
              defaultInputFormatters =
                  _getDefaultInputFormatters(mode, onlyPositive);
            }

            InputDecoration textFieldDecoration = const InputDecoration(
                border: InputBorder.none, isCollapsed: true);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    decoration: effectiveBoxDecor,
                    width: width ?? defaultWidth,
                    height: height ?? defaultHeight,
                    clipBehavior: Clip.hardEdge,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: GestureDetector(
                              child: Container(
                                  alignment: AlignmentDirectional.center,
                                  height: height ?? defaultHeight,
                                  color: buttonsColor.left,
                                  child: leftButtonIcon ??
                                      SvgPicture.asset(
                                          'assets/images/minus_sign.svg')),
                              onTap: () {
                                num _currentValue =
                                    _textToValue(mode, controller.text);
                                num _result = _currentValue - changeValueBy;
                                num _newValue = (onlyPositive && _result < min)
                                    ? min
                                    : _result;

                                controller.text = _newValue.toStringAsFixed(
                                    mode == NumberSelectFieldMode.int ? 0 : 1);

                                onChangedHandler(controller.text);
                              }),
                          flex:
                              flex?.buttons ?? flex?.leftButton ?? defaultFlex,
                        ),
                        Expanded(
                          child: Container(
                              child: TextFormField(
                            controller: state._effectiveController,
                            focusNode: focusNode,
                            decoration: textFieldDecoration,
                            keyboardType: TextInputType.number,
                            textInputAction: textInputAction,
                            style: style,
                            strutStyle: strutStyle,
                            textAlign: textAlign,
                            textAlignVertical: textAlignVertical,
                            textDirection: textDirection,
                            autofocus: autofocus,
                            toolbarOptions: toolbarOptions,
                            readOnly: readOnly,
                            showCursor: showCursor,
                            obscureText: false,
                            maxLengthEnforced: maxLengthEnforced,
                            maxLengthEnforcement: maxLengthEnforcement,
                            maxLines: 1,
                            minLines: 1,
                            expands: expands,
                            maxLength: maxLength,
                            onChanged: onChangedHandler,
                            onTap: onTap,
                            onEditingComplete: onEditingComplete,
                            initialValue: initialValue,
                            onFieldSubmitted: onFieldSubmitted,
                            inputFormatters:
                                inputFormatters ?? defaultInputFormatters,
                            enabled: enabled ?? true,
                            cursorWidth: cursorWidth,
                            cursorHeight: cursorHeight,
                            cursorRadius: cursorRadius,
                            cursorColor: cursorColor,
                            keyboardAppearance: keyboardAppearance,
                            enableInteractiveSelection:
                                enableInteractiveSelection,
                            selectionControls: selectionControls,
                            buildCounter: buildCounter,
                          )),
                          flex: flex?.textField ?? defaultFlex,
                        ),
                        Expanded(
                          child: GestureDetector(
                              child: Container(
                                  alignment: AlignmentDirectional.center,
                                  height: height ?? defaultHeight,
                                  color: buttonsColor.right,
                                  child: rightButtonIcon ??
                                      SvgPicture.asset(
                                          'assets/images/plus_sign.svg')),
                              onTap: () {
                                num currentValue =
                                    _textToValue(mode, controller.text);

                                controller.text = (currentValue + changeValueBy)
                                    .toStringAsFixed(
                                        mode == NumberSelectFieldMode.int
                                            ? 0
                                            : 1);
                                onChangedHandler(controller.text);
                              }),
                          flex:
                              flex?.buttons ?? flex?.rightButton ?? defaultFlex,
                        ),
                      ],
                    )),
                _getErrorContainer(field)
              ],
            );
          },
        );

  static Widget _getErrorContainer(FormFieldState<String> field) {
    return (field.errorText != null && field.errorText != '')
        ? Container(
            margin: EdgeInsets.only(top: 8),
            child: Text(
              field.errorText!,
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
          )
        : Container();
  }

  final int min;

  /// Controls the text being edited.
  ///
  /// If null, this widget will create its own [TextEditingController] and
  /// initialize its [TextEditingController.text] with [initialValue].
  final TextEditingController controller;

  /// Sets the value by which the number inside the input increase/decrease
  /// when the corresponding button is pressed
  final num changeValueBy;

  /// Sets flex property to buttons and text field
  final NumberSelectFieldFlex? flex;

  /// If true, number in text field can not be less than 0
  final bool onlyPositive;

  /// Sets new icon for left button
  /// If null, the icon will be plus sign
  final SvgPicture? leftButtonIcon;

  /// Sets new icon for right button
  /// If null the icon will be minus sign
  final SvgPicture? rightButtonIcon;

  /// Sets the height of the widget
  final double? height;

  /// Sets the width of the widget
  final double? width;

  /// Const for button flex if flex property is null
  static const int defaultFlex = 2;

  /// Const for default height of the widget (if height property is null)
  static const double defaultHeight = 50.0;

  /// Const for default width of the widget (if width property is null)
  static const double defaultWidth = 300.0;

  /// Sets colors for buttons
  final ButtonsColor buttonsColor;

  /// Defining number type inside text field
  final NumberSelectFieldMode mode;

  /// Returns num value with the type depending on mode given
  static num _textToValue(NumberSelectFieldMode mode, String inputValue) {
    TextToNumberConverter converter = TextToNumberConverter.getConverter(mode);
    num value = converter.convert(inputValue);

    return value;
  }

  static List<TextInputFormatter> _getDefaultInputFormatters(
      NumberSelectFieldMode mode, bool onlyPositive) {
    List<TextInputFormatter> defaultInputFormatters = [];

    RegExp regExp =
        onlyPositive ? RegExp(r'(^\d*\.?\d*)') : RegExp(r'(^-?\d*\.?\d*)');

    if (mode == NumberSelectFieldMode.double) {
      if (onlyPositive) {
        regExp = RegExp(r'(^\d*\.?\d*)');
      } else {
        regExp = RegExp(r'(^-?\d*\.?\d*)');
      }
    } else {
      if (onlyPositive) {
        regExp = RegExp(r'(^\d*)');
      } else {
        regExp = RegExp(r'(^-?\d*)');
      }
    }

    defaultInputFormatters.add(FilteringTextInputFormatter.allow(regExp));

    return defaultInputFormatters;
  }

  @override
  _NumberSelectFormFieldState createState() => _NumberSelectFormFieldState();
}

class _NumberSelectFormFieldState extends FormFieldState<String> {
  TextEditingController? controller;

  TextEditingController? get _effectiveController => widget.controller;

  @override
  NumberSelectFormField get widget => super.widget as NumberSelectFormField;

  @override
  void initState() {
    super.initState();

    if (widget.controller.text == '') {
      widget.controller.text = '0';
    }

    widget.controller.addListener(_handleControllerChanged);
  }

  @override
  void didUpdateWidget(NumberSelectFormField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      oldWidget.controller.removeListener(_handleControllerChanged);
      widget.controller.addListener(_handleControllerChanged);

      controller = TextEditingController.fromValue(oldWidget.controller.value);
      widget.controller.text = oldWidget.controller.text;
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_handleControllerChanged);
    super.dispose();
  }

  @override
  void didChange(String? value) {
    super.didChange(value);

    if (_effectiveController!.text != value)
      _effectiveController!.text = value ?? '';
  }

  @override
  void reset() {
    // setState will be called in the superclass, so even though state is being
    // manipulated, no setState call is needed here.
    _effectiveController!.text = widget.initialValue ?? '';
    super.reset();
  }

  void _handleControllerChanged() {
    // Suppress changes that originated from within this class.
    //
    // In the case where a controller has been passed in to this widget, we
    // register this change listener. In these cases, we'll also receive change
    // notifications for changes originating from within this class -- for
    // example, the reset() method. In such cases, the FormField value will
    // already have been set.
    if (_effectiveController!.text != value)
      didChange(_effectiveController!.text);
  }
}

enum NumberSelectFieldMode { int, double }

class NumberSelectFieldFlex {
  NumberSelectFieldFlex(
      {required this.textField,
      this.buttons,
      this.leftButton,
      this.rightButton})
      : assert(buttons != null || (leftButton != null && rightButton != null));

  int? buttons;
  int? leftButton;
  int? rightButton;
  int textField;
}

/// Class for defining buttons color
class ButtonsColor {
  const ButtonsColor({this.left = Colors.grey, this.right = Colors.grey});

  final Color? left;
  final Color? right;

  static ButtonsColor all({Color color = Colors.grey}) {
    return ButtonsColor(left: color, right: color);
  }
}

abstract class TextToNumberConverter {
  static TextToNumberConverter getConverter(NumberSelectFieldMode mode) {
    switch (mode) {
      case NumberSelectFieldMode.double:
        {
          return TextToDoubleConverter();
        }

      case NumberSelectFieldMode.int:
        {
          return TextToIntConverter();
        }
    }
  }

  num convert(String text);
}

class TextToDoubleConverter implements TextToNumberConverter {
  double convert(String text) {
    return double.tryParse(text) ?? 0;
  }
}

class TextToIntConverter implements TextToNumberConverter {
  int convert(String text) {
    return int.tryParse(text) ?? 0;
  }
}
