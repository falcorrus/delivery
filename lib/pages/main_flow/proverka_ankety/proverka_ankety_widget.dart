import '/backend/api_requests/api_calls.dart';
import '/components/row_back/row_back_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'proverka_ankety_model.dart';
export 'proverka_ankety_model.dart';

class ProverkaAnketyWidget extends StatefulWidget {
  const ProverkaAnketyWidget({
    Key? key,
    this.slug,
    this.nextslug,
    this.nextsort,
  }) : super(key: key);

  final String? slug;
  final String? nextslug;
  final int? nextsort;

  @override
  _ProverkaAnketyWidgetState createState() => _ProverkaAnketyWidgetState();
}

class _ProverkaAnketyWidgetState extends State<ProverkaAnketyWidget>
    with TickerProviderStateMixin {
  late ProverkaAnketyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProverkaAnketyModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'proverka-ankety'});

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
        body: Align(
          alignment: AlignmentDirectional(0.00, 0.00),
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 400.0,
              maxHeight: 900.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                wrapWithModel(
                  model: _model.rowBackModel,
                  updateCallback: () => setState(() {}),
                  child: RowBackWidget(),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.00, 0.00),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                25.0, 13.0, 0.0, 0.0),
                            child: Text(
                              'Анкета',
                              style: FlutterFlowTheme.of(context)
                                  .displaySmall
                                  .override(
                                    fontFamily: 'Montserrat',
                                    fontSize: 28.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              25.0, 20.0, 26.0, 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 10.0, 10.0),
                                    child: Text(
                                      'Видны признаки маргинального поведения (состояние опьянения, агрессивного поведения и пр.)',
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 10.0, 0.0),
                                  child: Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                    ),
                                    child: Checkbox(
                                      value: _model.checkbox1Value ??= false,
                                      onChanged: (newValue) async {
                                        setState(() =>
                                            _model.checkbox1Value = newValue!);
                                      },
                                      activeColor:
                                          FlutterFlowTheme.of(context).primary,
                                      checkColor:
                                          FlutterFlowTheme.of(context).info,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              25.0, 20.0, 26.0, 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 10.0, 10.0),
                                    child: Text(
                                      'Признаки мошенничества (паспорт имеет признаки подделки, признаки неплатежеспособности, неуверенное поведение и пр.)',
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 10.0, 0.0),
                                  child: Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                    ),
                                    child: Checkbox(
                                      value: _model.checkbox2Value ??= false,
                                      onChanged: (newValue) async {
                                        setState(() =>
                                            _model.checkbox2Value = newValue!);
                                      },
                                      activeColor:
                                          FlutterFlowTheme.of(context).primary,
                                      checkColor:
                                          FlutterFlowTheme.of(context).info,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              25.0, 20.0, 26.0, 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 10.0, 10.0),
                                    child: Text(
                                      'Принуждение клиентом (третьими лицами) курьера к оформлению заявки',
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 10.0, 0.0),
                                  child: Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                    ),
                                    child: Checkbox(
                                      value: _model.checkbox3Value ??= false,
                                      onChanged: (newValue) async {
                                        setState(() =>
                                            _model.checkbox3Value = newValue!);
                                      },
                                      activeColor:
                                          FlutterFlowTheme.of(context).primary,
                                      checkColor:
                                          FlutterFlowTheme.of(context).info,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ).animateOnPageLoad(
                      animationsMap['columnOnPageLoadAnimation']!),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          25.0, 10.0, 25.0, 16.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onLongPress: () async {
                          logFirebaseEvent(
                              'PROVERKA_ANKETY_Button-more_ON_LONG_PRES');
                          logFirebaseEvent('Button-more_backend_call');
                          _model.apiResultCopy =
                              await HappyGoAPIGroup.nextmoduleCall.call(
                            token: FFAppState().Token,
                            productID: FFAppState().prodslug,
                            code: widget.nextslug,
                            sort: widget.nextsort,
                          );
                          // вроде нигде не использую.
                          // Взамент Page state, они дают возвращаться нормально беком
                          logFirebaseEvent('Button-more_update_app_state');
                          FFAppState().nextslug = HappyGoAPIGroup.nextmoduleCall
                              .code(
                                (_model.apiNextModule?.jsonBody ?? ''),
                              )
                              .toString();
                          FFAppState().nextsort =
                              HappyGoAPIGroup.nextmoduleCall.sort(
                            (_model.apiNextModule?.jsonBody ?? ''),
                          );
                          logFirebaseEvent('Button-more_update_widget_state');
                          setState(() {
                            _model.nextSl = HappyGoAPIGroup.nextmoduleCall
                                .code(
                                  (_model.apiNextModule?.jsonBody ?? ''),
                                )
                                .toString();
                            _model.nextSo = HappyGoAPIGroup.nextmoduleCall.sort(
                              (_model.apiNextModule?.jsonBody ?? ''),
                            );
                          });
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
                                logFirebaseEvent('Button-more_navigate_to');

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
                                  logFirebaseEvent('Button-more_navigate_to');

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
                                    logFirebaseEvent('Button-more_navigate_to');

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

                          setState(() {});
                        },
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'PROVERKA_ANKETY_PAGE_Button-more_ON_TAP');
                            logFirebaseEvent('Button-more_backend_call');
                            _model.apiNextModule =
                                await HappyGoAPIGroup.nextmoduleCall.call(
                              token: FFAppState().Token,
                              productID: FFAppState().prodslug,
                              code: widget.nextslug,
                              sort: widget.nextsort,
                              a1: _model.checkbox1Value,
                              a2: _model.checkbox2Value,
                              a3: _model.checkbox3Value,
                              orderId: FFAppState().slug,
                            );
                            logFirebaseEvent('Button-more_update_widget_state');
                            _model.nextSl = HappyGoAPIGroup.nextmoduleCall
                                .code(
                                  (_model.apiNextModule?.jsonBody ?? ''),
                                )
                                .toString();
                            _model.nextSo = HappyGoAPIGroup.nextmoduleCall.sort(
                              (_model.apiNextModule?.jsonBody ?? ''),
                            );
                            if ((_model.apiNextModule?.succeeded ?? true)) {
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
                                    logFirebaseEvent('Button-more_navigate_to');

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
                                        'Verification',
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
                                        } else {
                                          if (_model.nextSl ==
                                              'cross_product') {
                                            logFirebaseEvent(
                                                'Button-more_navigate_to');

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
                          text: 'ДАЛЕЕ',
                          options: FFButtonOptions(
                            width: 327.0,
                            height: 48.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0xFF4460F0),
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
    );
  }
}
