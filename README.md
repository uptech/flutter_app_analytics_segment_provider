# Flutter App Analytics Segment Package

Implements support for Segment into the [Flutter App Analytics](https://github.com/uptech/flutter_app_analytics) package.

## How to use

```dart
SegmentProvider segment = SegmentProvider(writeKey: 'some_key');
Analytics analytics = ...;
analytics.providers = [segment];
```

## Testing

### Run Tests

```
flutter test
```
