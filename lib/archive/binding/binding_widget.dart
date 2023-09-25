import '/backend/api_requests/api_calls.dart';
import '/components/row_back/row_back_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'binding_model.dart';
export 'binding_model.dart';

class BindingWidget extends StatefulWidget {
  const BindingWidget({
    Key? key,
    this.nextslug,
    this.nextsort,
    this.slug,
  }) : super(key: key);

  final String? nextslug;
  final int? nextsort;
  final String? slug;

  @override
  _BindingWidgetState createState() => _BindingWidgetState();
}

class _BindingWidgetState extends State<BindingWidget> {
  late BindingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BindingModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Binding'});
    _model.inputField6Controller ??= TextEditingController();
    _model.inputField4Controller ??= TextEditingController();
    _model.textFieldSmsController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.00, 0.00),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              constraints: BoxConstraints(
                maxWidth: 400.0,
                maxHeight: 900.0,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                borderRadius: BorderRadius.circular(1.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  wrapWithModel(
                    model: _model.rowBackModel,
                    updateCallback: () => setState(() {}),
                    child: RowBackWidget(),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.00, 0.00),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(25.0, 13.0, 0.0, 0.0),
                      child: Text(
                        'Привязка карты',
                        textAlign: TextAlign.start,
                        style:
                            FlutterFlowTheme.of(context).displaySmall.override(
                                  fontFamily: 'Montserrat',
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(25.0, 24.0, 25.0, 20.0),
                    child: Container(
                      height: 70.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFF1F1FE),
                        borderRadius: BorderRadius.circular(11.0),
                        border: Border.all(
                          color: Color(0xFFEFEFF4),
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.00, 0.05),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              22.0, 0.0, 22.0, 10.0),
                          child: Text(
                            'Введите ID карты и последние 4 цифры номера карты для привязки карты.',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(25.0, 20.0, 25.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 2.0, 0.0, 2.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.4,
                              child: TextFormField(
                                controller: _model.inputField6Controller,
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 26.0,
                                      fontWeight: FontWeight.w500,
                                      lineHeight: 1.5,
                                    ),
                                textAlign: TextAlign.start,
                                keyboardType: TextInputType.number,
                                validator: _model.inputField6ControllerValidator
                                    .asValidator(context),
                                inputFormatters: [_model.inputField6Mask],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '** ****',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  fontSize: 26.0,
                                ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 2.0, 0.0, 2.0),
                            child: TextFormField(
                              controller: _model.inputField4Controller,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.inputField4Controller',
                                Duration(milliseconds: 2000),
                                () => setState(() {}),
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 26.0,
                                    fontWeight: FontWeight.w500,
                                    lineHeight: 1.5,
                                  ),
                              textAlign: TextAlign.start,
                              keyboardType: TextInputType.number,
                              validator: _model.inputField4ControllerValidator
                                  .asValidator(context),
                              inputFormatters: [_model.inputField4Mask],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              30.0, 0.0, 30.0, 0.0),
                          child: Container(
                            width: 315.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFF3F5F7),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              25.0, 20.0, 26.0, 0.0),
                          child: Container(
                            height: 47.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: TextFormField(
                              controller: _model.textFieldSmsController,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Введите ID карты',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              validator: _model.textFieldSmsControllerValidator
                                  .asValidator(context),
                              inputFormatters: [_model.textFieldSmsMask],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              25.0, 10.0, 25.0, 16.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'BINDING_PAGE_Button-more_ON_TAP');
                              logFirebaseEvent('Button-more_backend_call');
                              _model.apiResult =
                                  await HappyGoAPIGroup.nextmoduleCall.call(
                                token: FFAppState().Token,
                                productID: FFAppState().prodslug,
                                code: widget.nextslug,
                                sort: widget.nextsort,
                              );
                              if ((_model.apiResult?.succeeded ?? true)) {
                                logFirebaseEvent(
                                    'Button-more_update_widget_state');
                                _model.nextSl = HappyGoAPIGroup.nextmoduleCall
                                    .code(
                                      (_model.apiResult?.jsonBody ?? ''),
                                    )
                                    .toString();
                                _model.nextSo =
                                    HappyGoAPIGroup.nextmoduleCall.sort(
                                  (_model.apiResult?.jsonBody ?? ''),
                                );
                                if (_model.nextSl == 'show_agreement') {
                                  logFirebaseEvent('Button-more_navigate_to');

                                  context.pushNamed(
                                    'ShowAgreement',
                                    queryParameters: {
                                      'slug': serializeParam(
                                        FFAppState().slug,
                                        ParamType.String,
                                      ),
                                      'nextslug': serializeParam(
                                        _model.nextSl,
                                        ParamType.String,
                                      ),
                                      'nextsort': serializeParam(
                                        _model.nextSo,
                                        ParamType.int,
                                      ),
                                    }.withoutNulls,
                                  );
                                } else {
                                  if (_model.nextSl == 'photos') {
                                    logFirebaseEvent('Button-more_navigate_to');

                                    context.pushNamed(
                                      'Photos',
                                      queryParameters: {
                                        'slug': serializeParam(
                                          FFAppState().slug,
                                          ParamType.String,
                                        ),
                                        'nextslug': serializeParam(
                                          _model.nextSl,
                                          ParamType.String,
                                        ),
                                        'nextsort': serializeParam(
                                          _model.nextSo,
                                          ParamType.int,
                                        ),
                                      }.withoutNulls,
                                    );
                                  } else {
                                    if (_model.nextSl == 'wire_card') {
                                      logFirebaseEvent(
                                          'Button-more_navigate_to');

                                      context.pushNamed(
                                        'Binding',
                                        queryParameters: {
                                          'nextslug': serializeParam(
                                            _model.nextSl,
                                            ParamType.String,
                                          ),
                                          'nextsort': serializeParam(
                                            _model.nextSo,
                                            ParamType.int,
                                          ),
                                          'slug': serializeParam(
                                            FFAppState().slug,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    } else {
                                      if (_model.nextSl == 'verification') {
                                        logFirebaseEvent(
                                            'Button-more_navigate_to');

                                        context.pushNamed(
                                          'proverka-ankety',
                                          queryParameters: {
                                            'slug': serializeParam(
                                              FFAppState().slug,
                                              ParamType.String,
                                            ),
                                            'nextslug': serializeParam(
                                              _model.nextSl,
                                              ParamType.String,
                                            ),
                                            'nextsort': serializeParam(
                                              _model.nextSo,
                                              ParamType.int,
                                            ),
                                          }.withoutNulls,
                                        );
                                      } else {
                                        if (_model.nextSl == 'send_sms') {
                                          logFirebaseEvent(
                                              'Button-more_navigate_to');

                                          context.pushNamed(
                                            'SigningSms',
                                            queryParameters: {
                                              'slug': serializeParam(
                                                FFAppState().slug,
                                                ParamType.String,
                                              ),
                                              'nextslug': serializeParam(
                                                _model.nextSl,
                                                ParamType.String,
                                              ),
                                              'nextsort': serializeParam(
                                                _model.nextSo,
                                                ParamType.int,
                                              ),
                                            }.withoutNulls,
                                          );
                                        } else {
                                          if (_model.nextSl == 'check_report') {
                                            logFirebaseEvent(
                                                'Button-more_navigate_to');

                                            context.pushNamed(
                                              'proverka-ankety',
                                              queryParameters: {
                                                'slug': serializeParam(
                                                  FFAppState().slug,
                                                  ParamType.String,
                                                ),
                                                'nextslug': serializeParam(
                                                  _model.nextSl,
                                                  ParamType.String,
                                                ),
                                                'nextsort': serializeParam(
                                                  _model.nextSo,
                                                  ParamType.int,
                                                ),
                                              }.withoutNulls,
                                            );
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              } else {
                                logFirebaseEvent('Button-more_show_snack_bar');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Модули в сценарии закончились',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 2000),
                                    backgroundColor: Color(0xFFB8CFF5),
                                  ),
                                );
                                logFirebaseEvent('Button-more_wait__delay');
                                await Future.delayed(
                                    const Duration(milliseconds: 2000));
                                logFirebaseEvent('Button-more_navigate_to');

                                context.pushNamed(
                                  'DopMain',
                                  queryParameters: {
                                    'slug': serializeParam(
                                      FFAppState().slug,
                                      ParamType.String,
                                    ),
                                    'nextslug': serializeParam(
                                      _model.nextSl,
                                      ParamType.String,
                                    ),
                                    'nextsort': serializeParam(
                                      _model.nextSo,
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );
                              }

                              setState(() {});
                            },
                            text: 'ПРИВЯЗАТЬ',
                            options: FFButtonOptions(
                              width: 327.0,
                              height: 48.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).secondaryText,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    letterSpacing: 0.6,
                                    fontWeight: FontWeight.bold,
                                    lineHeight: 1.5,
                                  ),
                              elevation: 2.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            showLoadingIndicator: false,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
