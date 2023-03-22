library flutter_app_analytics_segment_provider;

import 'package:flutter_app_analytics/flutter_app_analytics.dart';
import 'package:flutter_segment/flutter_segment.dart';

import 'segment_driver.dart';
import 'segment_interface.dart';

export 'segment_driver.dart';
export 'segment_interface.dart';

/// A Segment Provider for Flutter app analytics.
class SegmentProvider implements AnalyticsProvider {
  @override
  List<String> allowedUserProperties = [];
  final SegmentInterface _driver;
  final String _writeKey;

  bool _initialized = false;

  SegmentProvider(
      {required String writeKey,
      SegmentInterface driver = const SegmentDriver(),
      List<String>? allowedProperties})
      : _driver = driver,
        _writeKey = writeKey,
        allowedUserProperties = allowedProperties ?? [];

  Future<void> initialize() async {
    if (_initialized) {
      return;
    }
    await _driver.config(
      options: SegmentConfig(
        writeKey: _writeKey,
        trackApplicationLifecycleEvents: false,
        amplitudeIntegrationEnabled: false,
        debug: false,
      ),
    );
    _initialized = true;
  }

  @override
  Future<void> identify({
    String? userId,
    Map<String, dynamic>? properties,
  }) async {
    initialize();
    await _driver.identify(userId: userId, traits: properties);
  }

  @override
  Future<void> trackEvent(AnalyticsEvent event) async {
    initialize();
    await _driver.track(eventName: event.name, properties: event.properties);
  }

  @override
  Future<void> trackEvents(List<AnalyticsEvent> events) async {
    initialize();
    await Future.forEach<AnalyticsEvent>(events, (event) => trackEvent(event));
  }
}
