import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_static_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mapbox_search/mapbox_search.dart';
import 'package:provider/provider.dart';
import 'order_model.dart';
export 'order_model.dart';

class OrderWidget extends StatefulWidget {
  const OrderWidget({
    Key? key,
    this.slug,
    this.nextslug,
    this.nextsort,
  }) : super(key: key);

  final String? slug;
  final String? nextslug;
  final int? nextsort;

  @override
  _OrderWidgetState createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  late OrderModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrderModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Order'});
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

    return FutureBuilder<ApiCallResponse>(
      future: HappyGoAPIGroup.orderCall.call(
        token: FFAppState().Token,
        slug: FFAppState().slug,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final orderOrderResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            body: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.00, -1.00),
                    child: FutureBuilder<ApiCallResponse>(
                      future: YandexCall.call(
                        geokode: valueOrDefault<String>(
                          '${HappyGoAPIGroup.orderCall.city(
                                orderOrderResponse.jsonBody,
                              ).toString()}+${HappyGoAPIGroup.orderCall.adress(
                                orderOrderResponse.jsonBody,
                              ).toString()}',
                          'Москва красная площадь',
                        ),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        final staticMapYandexResponse = snapshot.data!;
                        return FlutterFlowStaticMap(
                          location: functions.latLong((YandexCall.latLong(
                            staticMapYandexResponse.jsonBody,
                          ) as List)
                              .map<String>((s) => s.toString())
                              .toList()!
                              .map((e) => e.toString())
                              .toList()),
                          apiKey:
                              'pk.eyJ1IjoibGFwdHlzIiwiYSI6ImNsNnhndml5bzBjdXMzanJ4cnpxajA4N2cifQ.lmFnbGdUcyz_CQo1SA1YPA',
                          style: MapBoxStyle.Outdoors,
                          width: double.infinity,
                          height: 400.0,
                          fit: BoxFit.cover,
                          borderRadius: BorderRadius.circular(0.0),
                          markerColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          cached: true,
                          zoom: 12,
                          tilt: 0,
                          rotation: 0,
                        );
                      },
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.00, 1.00),
                    child: Container(
                      constraints: BoxConstraints(
                        maxHeight: 812.0,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 27.0,
                            color: Color(0x4A000000),
                            offset: Offset(0.0, 4.0),
                          )
                        ],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(26.0),
                          topRight: Radius.circular(26.0),
                        ),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.00, 0.00),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'ORDER_PAGE_Row-back_ON_TAP');
                                  logFirebaseEvent('Row-back_navigate_to');

                                  context.pushNamed('OrdersList');
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.00, -1.00),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 0.0),
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30.0,
                                          borderWidth: 1.0,
                                          buttonSize: 30.0,
                                          icon: Icon(
                                            Icons.chevron_left,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 14.0,
                                          ),
                                          onPressed: () {
                                            print('IconButton pressed ...');
                                          },
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Назад',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.00, 0.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    25.0, 6.0, 0.0, 0.0),
                                child: Text(
                                  'Статус заказа',
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
                                  25.0, 8.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 14.0, 0.0),
                                        child: Icon(
                                          Icons.circle,
                                          color: colorFromCssString(
                                            valueOrDefault<String>(
                                              HappyGoAPIGroup.orderCall
                                                  .color(
                                                    orderOrderResponse.jsonBody,
                                                  )
                                                  .toString(),
                                              'black',
                                            ),
                                            defaultColor: Colors.black,
                                          ),
                                          size: 12.0,
                                        ),
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          HappyGoAPIGroup.orderCall
                                              .status(
                                                orderOrderResponse.jsonBody,
                                              )
                                              .toString(),
                                          'error',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Montserrat',
                                              fontSize: 10.0,
                                              letterSpacing: 0.1,
                                              fontWeight: FontWeight.w500,
                                              lineHeight: 1.21,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 20.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'ORDER_PAGE_Text_0di0d8qc_ON_TAP');
                                        logFirebaseEvent('Text_backend_call');
                                        await HappyGoAPIGroup.statusCall.call(
                                          slug: widget.slug,
                                          status: 'waiting',
                                          token: FFAppState().Token,
                                        );
                                        logFirebaseEvent('Text_show_snack_bar');
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Возвращаем \"Ожидает доставку\"',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 2000),
                                            backgroundColor: Color(0xFFB8CFF5),
                                          ),
                                        );
                                        logFirebaseEvent(
                                            'Text_update_app_state');
                                        setState(() {
                                          FFAppState().nextsort = 0;
                                          FFAppState().nextslug = '';
                                        });
                                        logFirebaseEvent('Text_navigate_to');

                                        context.goNamed(
                                          'OrdersList',
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 300),
                                            ),
                                          },
                                        );
                                      },
                                      child: Text(
                                        valueOrDefault<String>(
                                          HappyGoAPIGroup.orderCall
                                              .id(
                                                orderOrderResponse.jsonBody,
                                              )
                                              .toString(),
                                          'id',
                                        ),
                                        textAlign: TextAlign.end,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color: Color(0xFFC6C6C6),
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.00, 0.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    25.0, 15.0, 0.0, 10.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    '${HappyGoAPIGroup.orderCall.start(
                                          orderOrderResponse.jsonBody,
                                        ).toString()} - ${HappyGoAPIGroup.orderCall.finish(
                                          orderOrderResponse.jsonBody,
                                        ).toString()}',
                                    'error',
                                  ),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xFF4460F0),
                                        fontSize: 28.0,
                                        letterSpacing: 0.1,
                                        fontWeight: FontWeight.bold,
                                        lineHeight: 1.22,
                                      ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.00, 0.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    25.0, 15.0, 0.0, 0.0),
                                child: Text(
                                  'Клиент',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xFF868686),
                                        fontSize: 10.0,
                                        letterSpacing: 0.1,
                                        lineHeight: 1.2,
                                      ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.00, 0.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    25.0, 0.0, 1.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    '${valueOrDefault<String>(
                                      HappyGoAPIGroup.orderCall
                                          .lastName(
                                            orderOrderResponse.jsonBody,
                                          )
                                          .toString(),
                                      'Фамилия',
                                    )} ${valueOrDefault<String>(
                                      HappyGoAPIGroup.orderCall
                                          .firstName(
                                            orderOrderResponse.jsonBody,
                                          )
                                          .toString(),
                                      'Имя',
                                    )} ${valueOrDefault<String>(
                                      HappyGoAPIGroup.orderCall
                                          .middleName(
                                            orderOrderResponse.jsonBody,
                                          )
                                          .toString(),
                                      'отчество',
                                    )}',
                                    'error',
                                  ),
                                  maxLines: 2,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        fontSize: 12.0,
                                        letterSpacing: 0.1,
                                        fontWeight: FontWeight.w500,
                                        lineHeight: 1.21,
                                      ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  25.0, 0.0, 15.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-1.00, -1.00),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.00, 1.00),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 15.0, 0.0, 0.0),
                                            child: Text(
                                              'Адрес',
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: Color(0xFF868686),
                                                    fontSize: 10.0,
                                                    letterSpacing: 0.1,
                                                    lineHeight: 1.2,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.00, 0.00),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'ORDER_PAGE_Text-address_ON_TAP');
                                              logFirebaseEvent(
                                                  'Text-address_show_snack_bar');
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    HappyGoAPIGroup.orderCall
                                                        .adresClient(
                                                          orderOrderResponse
                                                              .jsonBody,
                                                        )
                                                        .toString(),
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              );
                                            },
                                            child: Text(
                                              HappyGoAPIGroup.orderCall
                                                  .adresClient(
                                                    orderOrderResponse.jsonBody,
                                                  )
                                                  .toString(),
                                              maxLines: 2,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.1,
                                                    fontWeight: FontWeight.w500,
                                                    lineHeight: 1.21,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 50.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: FutureBuilder<ApiCallResponse>(
                                      future: YandexCall.call(
                                        geokode: valueOrDefault<String>(
                                          '${HappyGoAPIGroup.orderCall.city(
                                                orderOrderResponse.jsonBody,
                                              ).toString()}+${HappyGoAPIGroup.orderCall.adress(
                                                orderOrderResponse.jsonBody,
                                              ).toString()}',
                                          'Москва красная площадь',
                                        ),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        final iconButtonYandexResponse =
                                            snapshot.data!;
                                        return FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 18.0,
                                          borderWidth: 1.0,
                                          buttonSize: 48.0,
                                          icon: Icon(
                                            Icons.map_outlined,
                                            color: Color(0xFF4460F0),
                                            size: 18.0,
                                          ),
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'ORDER_PAGE_map_outlined_ICN_ON_TAP');
                                            logFirebaseEvent(
                                                'IconButton_launch_u_r_l');
                                            await launchURL(
                                                valueOrDefault<String>(
                                              'https://yandex.ru/maps/?pt=${functions.textLat(functions.latLong((YandexCall.latLong(
                                                iconButtonYandexResponse
                                                    .jsonBody,
                                              ) as List).map<String>((s) => s.toString()).toList()!.map((e) => e.toString()).toList()))}',
                                              '0',
                                            ));
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  25.0, 0.0, 15.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-1.00, -1.00),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.00, 0.00),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 20.0, 0.0, 0.0),
                                            child: Text(
                                              'Номер телефона',
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: Color(0xFF868686),
                                                    fontSize: 10.0,
                                                    letterSpacing: 0.1,
                                                    lineHeight: 1.2,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.00, 0.00),
                                          child: Text(
                                            valueOrDefault<String>(
                                              HappyGoAPIGroup.orderCall
                                                  .phone(
                                                    orderOrderResponse.jsonBody,
                                                  )
                                                  .toString(),
                                              'error',
                                            ),
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.1,
                                                  fontWeight: FontWeight.w500,
                                                  lineHeight: 1.21,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 50.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 18.0,
                                      borderWidth: 1.0,
                                      buttonSize: 32.0,
                                      icon: Icon(
                                        Icons.phone,
                                        color: Color(0xFF4460F0),
                                        size: 18.0,
                                      ),
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'ORDER_PAGE_phone_ICN_ON_TAP');
                                        logFirebaseEvent(
                                            'IconButton_launch_u_r_l');
                                        await launchURL(
                                            'tel:${valueOrDefault<String>(
                                          getJsonField(
                                            orderOrderResponse.jsonBody,
                                            r'''$.phone''',
                                          ).toString(),
                                          '0',
                                        )}');
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.00, 0.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    25.0, 20.0, 0.0, 0.0),
                                child: Text(
                                  'Название продукта',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xFF868686),
                                        fontSize: 10.0,
                                        letterSpacing: 0.1,
                                        lineHeight: 1.2,
                                      ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.00, 0.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    25.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    HappyGoAPIGroup.orderCall
                                        .product(
                                          orderOrderResponse.jsonBody,
                                        )
                                        .toString(),
                                    'продукт',
                                  ),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        fontSize: 12.0,
                                        letterSpacing: 0.1,
                                        fontWeight: FontWeight.w500,
                                        lineHeight: 1.21,
                                      ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.00, 0.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    25.0, 20.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'ORDER_PAGE_Text-title_date_ON_TAP');
                                    logFirebaseEvent(
                                        'Text-title_date_show_snack_bar');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          FFAppState().nextslug,
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 1000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Дата встречи',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Color(0xFF868686),
                                          fontSize: 10.0,
                                          letterSpacing: 0.1,
                                          lineHeight: 1.2,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.00, 0.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    25.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    HappyGoAPIGroup.orderCall
                                        .date(
                                          orderOrderResponse.jsonBody,
                                        )
                                        .toString(),
                                    'error',
                                  ),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        fontSize: 12.0,
                                        letterSpacing: 0.1,
                                        fontWeight: FontWeight.w500,
                                        lineHeight: 1.21,
                                      ),
                                ),
                              ),
                            ),

                            // Из status waiting "Ожидает доставку" показываем "Подтвердить встречу" (статус "meeting_confirmed"
                            if (getJsonField(
                                  orderOrderResponse.jsonBody,
                                  r'''$.data.status.slug''',
                                ) ==
                                'waiting')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 32.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 15.0, 24.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'ORDER_ПОДТВЕРДИТЬ_ВСТРЕЧУ_BTN_ON_TAP');
                                          logFirebaseEvent(
                                              'Button_backend_call');
                                          await HappyGoAPIGroup.statusCall.call(
                                            slug: widget.slug,
                                            status: 'meeting_confirmed',
                                            token: FFAppState().Token,
                                            comment: ' ',
                                          );
                                          logFirebaseEvent(
                                              'Button_backend_call');
                                          _model.apiOrder =
                                              await HappyGoAPIGroup.orderCall
                                                  .call(
                                            token: FFAppState().Token,
                                            slug: FFAppState().slug,
                                          );
                                          if (HappyGoAPIGroup.orderCall
                                                  .statusslug(
                                                    (_model.apiOrder
                                                            ?.jsonBody ??
                                                        ''),
                                                  )
                                                  .toString() ==
                                              'meeting_confirmed') {
                                            logFirebaseEvent(
                                                'Button_show_snack_bar');
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Встреча подтверждена',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 2000),
                                                backgroundColor:
                                                    Color(0xFFB8CFF5),
                                              ),
                                            );
                                          } else {
                                            logFirebaseEvent(
                                                'Button_show_snack_bar');
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Встреча НЕ подтверждена',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 2000),
                                                backgroundColor:
                                                    Color(0xFFB8CFF5),
                                              ),
                                            );
                                          }

                                          logFirebaseEvent(
                                              'Button_backend_call');
                                          _model.apiResultProduct2 =
                                              await HappyGoAPIGroup
                                                  .nextmoduleCall
                                                  .call(
                                            token: FFAppState().Token,
                                            productID: FFAppState().prodslug,
                                            code: widget.nextslug,
                                            sort: widget.nextsort,
                                            orderId: FFAppState().slug,
                                          );
                                          if ((_model.apiResultProduct2
                                                  ?.succeeded ??
                                              true)) {
                                            logFirebaseEvent(
                                                'Button_update_app_state');
                                            setState(() {
                                              FFAppState().nextslug =
                                                  valueOrDefault<String>(
                                                HappyGoAPIGroup.nextmoduleCall
                                                    .code(
                                                      (_model.apiResultProduct2
                                                              ?.jsonBody ??
                                                          ''),
                                                    )
                                                    .toString(),
                                                '111',
                                              );
                                              FFAppState().nextsort =
                                                  HappyGoAPIGroup.nextmoduleCall
                                                      .sort(
                                                (_model.apiResultProduct2
                                                        ?.jsonBody ??
                                                    ''),
                                              );
                                            });
                                            logFirebaseEvent(
                                                'Button_update_widget_state');
                                            setState(() {
                                              _model.nextSl =
                                                  HappyGoAPIGroup.nextmoduleCall
                                                      .code(
                                                        (_model.apiResultProduct2
                                                                ?.jsonBody ??
                                                            ''),
                                                      )
                                                      .toString();
                                              _model.nextSo = HappyGoAPIGroup
                                                  .nextmoduleCall
                                                  .sort(
                                                (_model.apiResultProduct2
                                                        ?.jsonBody ??
                                                    ''),
                                              );
                                            });
                                          } else {
                                            logFirebaseEvent(
                                                'Button_show_snack_bar');
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Next api не прошел',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    Color(0xFFB8CFF5),
                                              ),
                                            );
                                          }

                                          logFirebaseEvent(
                                              'Button_navigate_to');

                                          context.goNamed(
                                            'OrdersList',
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 300),
                                              ),
                                            },
                                          );

                                          setState(() {});
                                        },
                                        text: 'ПОДТВЕРДИТЬ ВСТРЕЧУ',
                                        options: FFButtonOptions(
                                          width: 327.0,
                                          height: 48.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0xFF4460F0),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
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
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        showLoadingIndicator: false,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 15.0, 24.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'ORDER_PAGE_ОТМЕНИТЬ_ВСТРЕЧУ_BTN_ON_TAP');
                                          logFirebaseEvent(
                                              'Button_navigate_to');

                                          context.pushNamed(
                                            'status',
                                            queryParameters: {
                                              'slug': serializeParam(
                                                widget.slug,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        text: 'ОТМЕНИТЬ ВСТРЕЧУ',
                                        options: FFButtonOptions(
                                          width: 327.0,
                                          height: 48.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0xFFEAEAEA),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: Color(0xFF5F5F5F),
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
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        showLoadingIndicator: false,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            // status meeting_confirmed "Встреча подтверждена"
                            if ((HappyGoAPIGroup.orderCall
                                        .statusslug(
                                          orderOrderResponse.jsonBody,
                                        )
                                        .toString() ==
                                    'meeting_confirmed') ||
                                (HappyGoAPIGroup.orderCall
                                        .statusslug(
                                          orderOrderResponse.jsonBody,
                                        )
                                        .toString() ==
                                    'nacat-vstrecu') ||
                                (HappyGoAPIGroup.orderCall
                                        .statusslug(
                                          orderOrderResponse.jsonBody,
                                        )
                                        .toString() ==
                                    'waiting_verification'))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 32.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 15.0, 24.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'ORDER_PAGE_НАЧАТЬ_ВСТРЕЧУ_BTN_ON_TAP');
                                          logFirebaseEvent(
                                              'Button_backend_call');
                                          await HappyGoAPIGroup.statusCall.call(
                                            slug: widget.slug,
                                            status: 'nacat-vstrecu',
                                            token: FFAppState().Token,
                                          );
                                          if (FFAppState().nextslug ==
                                              'show_agreement') {
                                            logFirebaseEvent(
                                                'Button_navigate_to');

                                            context.pushNamed(
                                              'ShowAgreement',
                                              queryParameters: {
                                                'slug': serializeParam(
                                                  FFAppState().slug,
                                                  ParamType.String,
                                                ),
                                                'nextslug': serializeParam(
                                                  FFAppState().nextslug,
                                                  ParamType.String,
                                                ),
                                                'nextsort': serializeParam(
                                                  FFAppState().nextsort,
                                                  ParamType.int,
                                                ),
                                              }.withoutNulls,
                                            );
                                          } else {
                                            if (FFAppState().nextslug ==
                                                'photos') {
                                              logFirebaseEvent(
                                                  'Button_navigate_to');

                                              context.pushNamed(
                                                'Photos',
                                                queryParameters: {
                                                  'slug': serializeParam(
                                                    widget.slug,
                                                    ParamType.String,
                                                  ),
                                                  'nextslug': serializeParam(
                                                    FFAppState().nextslug,
                                                    ParamType.String,
                                                  ),
                                                  'nextsort': serializeParam(
                                                    FFAppState().nextsort,
                                                    ParamType.int,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else {
                                              if (FFAppState().nextslug ==
                                                  'wire_card') {
                                                logFirebaseEvent(
                                                    'Button_navigate_to');

                                                context.pushNamed(
                                                  'Binding',
                                                  queryParameters: {
                                                    'nextslug': serializeParam(
                                                      FFAppState().nextslug,
                                                      ParamType.String,
                                                    ),
                                                    'nextsort': serializeParam(
                                                      FFAppState().nextsort,
                                                      ParamType.int,
                                                    ),
                                                    'slug': serializeParam(
                                                      FFAppState().slug,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              } else {
                                                if (FFAppState().nextslug ==
                                                    'wire_card') {
                                                  logFirebaseEvent(
                                                      'Button_navigate_to');

                                                  context.pushNamed(
                                                    'Binding',
                                                    queryParameters: {
                                                      'nextslug':
                                                          serializeParam(
                                                        FFAppState().nextslug,
                                                        ParamType.String,
                                                      ),
                                                      'nextsort':
                                                          serializeParam(
                                                        FFAppState().nextsort,
                                                        ParamType.int,
                                                      ),
                                                      'slug': serializeParam(
                                                        FFAppState().slug,
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                } else {
                                                  if (FFAppState().nextslug ==
                                                      'send_sms') {
                                                    logFirebaseEvent(
                                                        'Button_navigate_to');

                                                    context.pushNamed(
                                                      'SigningSms',
                                                      queryParameters: {
                                                        'slug': serializeParam(
                                                          FFAppState().slug,
                                                          ParamType.String,
                                                        ),
                                                        'nextslug':
                                                            serializeParam(
                                                          FFAppState().nextslug,
                                                          ParamType.String,
                                                        ),
                                                        'nextsort':
                                                            serializeParam(
                                                          FFAppState().nextsort,
                                                          ParamType.int,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  } else {
                                                    if (FFAppState().nextslug ==
                                                        'check_report') {
                                                      logFirebaseEvent(
                                                          'Button_navigate_to');

                                                      context.pushNamed(
                                                        'proverka-ankety',
                                                        queryParameters: {
                                                          'slug':
                                                              serializeParam(
                                                            FFAppState().slug,
                                                            ParamType.String,
                                                          ),
                                                          'nextslug':
                                                              serializeParam(
                                                            FFAppState()
                                                                .nextslug,
                                                            ParamType.String,
                                                          ),
                                                          'nextsort':
                                                              serializeParam(
                                                            FFAppState()
                                                                .nextsort,
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
                                        },
                                        text: 'НАЧАТЬ ВСТРЕЧУ',
                                        options: FFButtonOptions(
                                          width: 327.0,
                                          height: 48.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0xFF4460F0),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
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
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        showLoadingIndicator: false,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 15.0, 24.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'ORDER_PAGE_ОТМЕНИТЬ_ВСТРЕЧУ_BTN_ON_TAP');
                                          logFirebaseEvent(
                                              'Button_navigate_to');

                                          context.pushNamed(
                                            'status',
                                            queryParameters: {
                                              'slug': serializeParam(
                                                widget.slug,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        text: 'ОТМЕНИТЬ ВСТРЕЧУ',
                                        options: FFButtonOptions(
                                          width: 327.0,
                                          height: 48.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0xFFEAEAEA),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: Color(0xFF5F5F5F),
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
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        showLoadingIndicator: false,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            if ((HappyGoAPIGroup.orderCall
                                        .status(
                                          orderOrderResponse.jsonBody,
                                        )
                                        .toString() ==
                                    'Верификация пройдена') ||
                                (HappyGoAPIGroup.orderCall
                                        .status(
                                          orderOrderResponse.jsonBody,
                                        )
                                        .toString() ==
                                    'Верификация не пройдена'))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 15.0, 24.0, 32.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'ORDER_PAGE_КАРТА_ВЫДАНА_BTN_ON_TAP');
                                    logFirebaseEvent('Button_backend_call');
                                    _model.apiResultntr =
                                        await HappyGoAPIGroup.statusCall.call(
                                      token: FFAppState().Token,
                                      slug: FFAppState().slug,
                                      status: 'zaversit-vstrecu',
                                    );
                                    if (!(_model.apiResultntr?.succeeded ??
                                        true)) {
                                      logFirebaseEvent('Button_navigate_to');

                                      context.pushNamed(
                                        'status',
                                        queryParameters: {
                                          'slug': serializeParam(
                                            widget.slug,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    }

                                    setState(() {});
                                  },
                                  text: 'КАРТА ВЫДАНА',
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
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
