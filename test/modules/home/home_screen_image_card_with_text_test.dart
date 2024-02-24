import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:locateme/common/theming/app_theme.dart';
import 'package:locateme/domain/get_location/data_sources/location_remote_data_source.dart';
import 'package:locateme/domain/get_location/models/location_argument_data.dart';
import 'package:locateme/domain/get_location/models/location_event_data.dart';
import 'package:locateme/domain/get_location/repositories/location_event_repository_impl.dart';
import 'package:locateme/domain/get_location/usecases/location_event_use_cases.dart';
import 'package:locateme/main.dart';
import 'package:locateme/modules/home/home_screen.dart';
import 'package:locateme/modules/home/home_scroll_bloc/home_scroll_bloc.dart';
import 'package:locateme/modules/home/home_scroll_bloc/home_scroll_event.dart';
import 'package:locateme/modules/home/home_scroll_bloc/home_scroll_state.dart';
import 'package:locateme/modules/home/widgets/image_card_with_text_list.dart';
import 'package:provider/provider.dart';

void main() {
  setupTest();
  testWidgets('home screen image card with text test',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(ChangeNotifierProvider(
        create: (_) => AppThemeNotifier(),
        builder: (context, _) {
          return MaterialApp(
            home: Material(child: Builder(builder: (context) {
              var result = appLocalization.locations;
              debugPrint('[DEBUG]: locale: $result');
              return const HomeScreen();
            })),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: context.watch<AppThemeNotifier>().themeMode,
            navigatorKey: NavigationService.navigatorKey,
          );
        }));
    await tester.pumpAndSettle(const Duration(milliseconds: 100));
    expect(find.byType(ImageCardWithTextList), findsOneWidget);
  });
}

class HomeScrollBlocTest extends HomeScrollBloc {
  factory HomeScrollBlocTest() {
    return HomeScrollBlocTest.private();
  }
  @override
  void initialize() {
    on<HomeScrollEventCaptured>(_onHomeScrollEventCaptured);
    on<HomeScrollEventUpdate>(_onHomeScrollEventUpdate);
  }

  /// [_onHomeScrollEventUpdate] maintains a loop to continuesly check for the
  /// scroll updates.
  void _onHomeScrollEventUpdate(
      HomeScrollEventUpdate event, Emitter<HomeScrollStateUpdate> emit) async {
    add((HomeScrollEventCaptured(
      scrollableSizeValue: event.scrollableSizeValue(),
      topPadding: event.topPadding,
      bottomPadding: event.bottomPadding,
      screenSize: event.screenSize,
    )));
  }

  /// [_onHomeScrollEventCaptured] will be called when there is scrolling
  /// but here we have timer to make sure if we miss the scrolling event.
  /// to get the last scroll position. based on the scroll postion
  /// widget will be rendered
  void _onHomeScrollEventCaptured(HomeScrollEventCaptured event,
      Emitter<HomeScrollStateUpdate> emit) async {
    emit(
      const HomeScrollStateUpdate(
        stepState: ScrollStepState.showCardWithTitle,
      ),
    );
  }

  HomeScrollBlocTest.private();
}

final getIt = GetIt.instance;

void setupTest() {
  getIt.registerSingleton<LocationEventUseCases>(
    LocationEventUseCasesImpl(
      repository: LocationEventRepositoryImpl(
        remoteDataSource: LocationMockDataSourceImplTest(),
      ),
    ),
  );
  getIt.registerFactory<HomeScrollBloc>(
    () => HomeScrollBlocTest(),
  );
}

class LocationMockDataSourceImplTest implements LocationDataSource {
  /// [LocationMockDataSourceImplTest] will provide user with mock
  /// Api response to user.
  LocationMockDataSourceImplTest();

  static String getMockData() {
    return _responseMock;
  }

  /// Mock response given to The mobile screen.
  /// [Future<LocationData>] to handle the Failure or result data.
  @override
  Future<LocationData> getLocationData(
      {required LocationArgumentModel argumentModel}) async {
    return LocationData.fromRawJson(_responseMock);
  }
}

/// Mock json data
var _responseMock = """
{
  "results": [
    {
      "title": "21 of the Most Beautiful Places in India | Travel",
      "image_url": "https://luckyapp.in/test/1.jpg",
      "star_rating": 3,
      "location_lat": 3.5,
      "location_long": 3.5
    },
    {
      "title": "Green place for trees. | Beautiful nature wallpaper,",
      "image_url": "https://luckyapp.in/test/2.jpg",
      "star_rating": 4,
      "location_lat": 12.5,
      "location_long": 12.5
    },
    {
      "title": "5 of the Greenest Places in the World",
      "image_url": "https://luckyapp.in/test/3.jpg",
      "star_rating": 2,
      "location_lat": 22.5,
      "location_long": 22.5
    },
    {
      "title": "Beautiful Green place.n5 image uploaded on Jan",
      "image_url": "https://luckyapp.in/test/4.jpg",
      "star_rating": 5,
      "location_lat": 44.5,
      "location_long": 44.5
    },
    {
      "title": "HD beautiful place grass wallpapers | Peakpx",
      "image_url": "https://luckyapp.in/test/5.jpg",
      "star_rating": 3,
      "location_lat": 55.5,
      "location_long": 66.5
    }
  ]
}
""";
