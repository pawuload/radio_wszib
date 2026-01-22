# Analiza projektu - Radio HLS Streaming Application

## 1. Ogólny opis projektu

### 1.1 Cel aplikacji
Aplikacja jest minimalistycznym odtwarzaczem radia internetowego, który umożliwia odbiór strumienia audio HLS z autorskiego serwera radiowego działającego na oprogramowaniu AzuraCast. Głównym założeniem projektu jest stworzenie aplikacji multiplatformowej działającej na jak największej liczbie platform przy użyciu Flutter.

### 1.2 Charakterystyka
- **Typ aplikacji**: Streaming audio (HLS)
- **Framework**: Flutter 3.10+
- **Język programowania**: Dart 3.9.0+
- **Architektura**: Oparta na bibliotece `utopia_arch` (wzorzec architektoniczny z użyciem hooks)
- **Główna funkcjonalność**: Odtwarzanie strumienia radiowego 24/7 z możliwością odtwarzania w tle

### 1.3 Źródło strumienia
- **URL strumienia HLS**: `https://project.office.utopiasoft.io/hls/projectslav/live.m3u8`
- **API informacji o utworze**: `https://project.office.utopiasoft.io/api/nowplaying/projectslav`
- **Serwer**: AzuraCast (autorski serwer autora pracy)

## 2. Architektura aplikacji

### 2.1 Wzorzec architektoniczny
Aplikacja wykorzystuje architekturę opartą na:
- **Hooks-based architecture** (przez bibliotekę `utopia_arch`)
- **Dependency Injection** (własny system przez `AppInjector`)
- **State Management** (custom hooks i computed states)
- **Separation of Concerns** (rozdzielenie logiki od widoku)

### 2.2 Struktura folderów
```
lib/
├── app/                    # Główna konfiguracja aplikacji
│   ├── app.dart           # Główny widget aplikacji
│   ├── app_config.dart    # Konfiguracja (URL-e, wersja)
│   ├── app_injector.dart  # Dependency Injection
│   ├── app_routing.dart   # Routing
│   ├── state/             # Globalne stany aplikacji
│   │   ├── audio/         # Stan odtwarzacza audio
│   │   ├── initialization/ # Stan inicjalizacji
│   │   ├── precache/      # Stan preładowania obrazów
│   │   └── router/        # Stan routera
│   └── widget/            # Globalne widgety
├── common/                # Wspólne komponenty
│   ├── constant/         # Stałe (kolory, ikony, obrazy, motyw)
│   └── widget/           # Wspólne widgety
├── model/                # Modele danych
│   ├── api/result/       # Wyniki API (Result pattern)
│   └── song/             # Model utworu
├── screen/               # Ekrany aplikacji
│   ├── connectivity/     # Ekran braku połączenia
│   ├── radio/           # Główny ekran radia
│   │   ├── state/       # Stan ekranu radia
│   │   ├── view/        # Widok ekranu radia
│   │   └── widget/      # Widgety ekranu radia
│   └── splash/          # Ekran powitalny
├── service/              # Serwisy
│   ├── api/             # Serwis API
│   └── audio/           # Serwisy audio
└── util/                # Narzędzia pomocnicze
    ├── audio_player/    # Narzędzia odtwarzacza
    ├── extension/       # Rozszerzenia
    └── hook/            # Custom hooks
```

### 2.3 Dependency Injection
System DI zaimplementowany przez `AppInjector`:
- `AppConfig` - konfiguracja aplikacji
- `RadioApiService` - serwis do pobierania informacji o utworze
- `BackgroundAudioService` - serwis do zarządzania odtwarzaniem w tle

## 3. Używane biblioteki i technologie

### 3.1 Biblioteki architektoniczne
- **utopia_arch** (^0.5.1+16) - framework architektoniczny z hooks
- **fast_immutable_collections** (^11.0.3) - niezmienne kolekcje

### 3.2 Biblioteki audio
- **just_audio** (^0.9.36) - główna biblioteka do odtwarzania audio
- **audio_service** (^0.18.18) - obsługa odtwarzania w tle i powiadomień systemowych
- **audio_streamer** (^4.1.1) - dodatkowe narzędzia do streamingu

### 3.3 Biblioteki sieciowe
- **dio** (^5.8.0+1) - klient HTTP do komunikacji z API

### 3.4 Biblioteki UI
- **flutter_svg** (^2.0.0+1) - obsługa SVG
- **rive** (^0.13.20) - animacje Rive (używane do animacji płyty winylowej)
- **auto_size_text** (^3.0.0) - automatyczne skalowanie tekstu
- **fluid_background** (^1.0.2) - płynne tło

### 3.5 Biblioteki narzędziowe
- **permission_handler** (^11.4.0) - zarządzanie uprawnieniami
- **intl** (^0.20.2) - internacjonalizacja
- **url_launcher** (^6.3.1) - otwieranie URL-i
- **shared_preferences** (^2.2.2) - przechowywanie danych lokalnych

### 3.6 Biblioteki utopia (własne)
- **utopia_firebase_crashlytics** (^0.2.0) - integracja z Firebase Crashlytics
- **utopia_localization_utils** (^0.0.1) - narzędzia lokalizacji
- **utopia_connectivity** (^0.1.0+46) - zarządzanie połączeniem sieciowym

### 3.7 Code generation
- **freezed** (^3.0.4) - generowanie niezmiennych klas
- **json_serializable** (^6.0.1) - serializacja JSON
- **build_runner** (^2.4.11) - generator kodu
- **utopia_localization_generator** (^0.0.2+2) - generator lokalizacji

## 4. Funkcjonalności aplikacji

### 4.1 Główne funkcjonalności
1. **Odtwarzanie strumienia HLS**
   - Odtwarzanie strumienia radiowego w formacie HLS
   - Kontrola odtwarzania (play/pause)
   - Automatyczne wznowienie po przerwie w połączeniu

2. **Odtwarzanie w tle**
   - Działanie aplikacji w tle
   - Odtwarzanie przy zablokowanym ekranie
   - Powiadomienia systemowe z informacją o utworze

3. **Wyświetlanie informacji o utworze**
   - Pobieranie aktualnie odtwarzanego utworu z API
   - Wyświetlanie tytułu utworu
   - Wyświetlanie okładki (losowa z dostępnych)

4. **Obsługa połączenia sieciowego**
   - Wykrywanie braku połączenia
   - Automatyczne zatrzymanie odtwarzania przy braku Internetu
   - Ekran informacyjny o braku połączenia

5. **Ekran powitalny (Splash Screen)**
   - Wyświetlanie podczas inicjalizacji
   - Automatyczne przekierowanie po zakończeniu inicjalizacji

### 4.2 Interfejs użytkownika
- **Minimalistyczny design** - prosty, czytelny interfejs
- **Animowana płyta winylowa** - animacja Rive reagująca na stan odtwarzania
- **Dynamiczny przycisk Play/Pause** - zmienia kształt i zawartość w zależności od stanu
- **Responsive design** - dostosowanie do różnych rozmiarów ekranów
- **Ciemny motyw** - ciemny interfejs użytkownika

### 4.3 Obsługa błędów
- Globalne okno dialogowe błędów (`AppGlobalErrorDialog`)
- Specjalna obsługa błędów połączenia audio
- Komunikaty błędów w języku polskim
- Automatyczne próby ponownego połączenia

## 5. Obsługiwane platformy

### 5.1 Platformy mobilne
- **Android** - od wersji 7.0 (Nougat)
  - Konfiguracja: `android/app/src/main/AndroidManifest.xml`
  - Obsługa odtwarzania w tle przez `audio_service`
  - Powiadomienia systemowe

- **iOS** - od wersji 12
  - Konfiguracja: `ios/Runner/Info.plist`
  - Obsługa odtwarzania w tle
  - Wsparcie dla różnych orientacji ekranu

### 5.2 Platformy desktopowe
- **Windows** - od wersji 10
  - Konfiguracja: `windows/runner/`
  - CMakeLists.txt dla kompilacji

- **macOS** - od wersji 10.14 (Mojave)
  - Konfiguracja: `macos/Runner/`
  - Xcode project

- **Linux** - zgodne dystrybucje z obsługą Flutter Desktop
  - Konfiguracja: `linux/runner/`
  - CMakeLists.txt dla kompilacji

### 5.3 Platforma web
- **Web** - aktualne przeglądarki wspierane przez Flutter Web
  - Konfiguracja: `web/index.html`, `web/manifest.json`
  - PWA support (manifest.json)
  - Ikony dla różnych urządzeń

## 6. Kluczowe komponenty

### 6.1 AudioState
Główny stan zarządzający odtwarzaniem audio:
- Inicjalizacja `BackgroundAudioHandler`
- Zarządzanie stanem odtwarzania (play/pause)
- Pobieranie informacji o utworze z API (co 10 sekund)
- Aktualizacja powiadomień systemowych
- Obsługa cyklu życia aplikacji (zatrzymanie przy detach na Androidzie)
- Automatyczne zatrzymanie przy braku połączenia

**Kluczowe metody:**
- `play()` - rozpoczęcie odtwarzania
- `pause()` - zatrzymanie odtwarzania
- `togglePlay()` - przełączenie stanu odtwarzania
- `updateNotification()` - aktualizacja powiadomienia

### 6.2 BackgroundAudioHandler
Obsługa odtwarzania w tle:
- Rozszerza `BaseAudioHandler` z `audio_service`
- Używa `AudioPlayer` z `just_audio`
- Synchronizacja stanu z `audio_service`
- Aktualizacja powiadomień systemowych

**Kluczowe metody:**
- `init(String url)` - inicjalizacja z URL strumienia
- `play()` - odtwarzanie
- `pause()` - pauza
- `stop()` - zatrzymanie
- `updateNotification()` - aktualizacja powiadomienia z tytułem i okładką

### 6.3 BackgroundAudioService
Serwis inicjalizujący `BackgroundAudioHandler`:
- Konfiguracja `AudioServiceConfig`
- Konfiguracja kanału powiadomień Android
- Inicjalizacja handlera

### 6.4 RadioApiService
Serwis do komunikacji z API:
- Pobieranie aktualnie odtwarzanego utworu
- Używa `Dio` do żądań HTTP
- Zwraca `ApiResult<SongModel>` (Result pattern)

### 6.5 RadioScreen
Główny ekran aplikacji:
- Wyświetla animowaną płytę winylową (Rive)
- Przycisk Play/Pause z animacjami
- Wyświetlanie tytułu utworu
- Obsługa błędów (ekran "Radio jest offline")

### 6.6 SplashScreen
Ekran powitalny:
- Wyświetlanie logo podczas inicjalizacji
- Automatyczne przekierowanie do `RadioScreen` po zakończeniu inicjalizacji
- Oczekiwanie na `InitializationState.isInitialized`

## 7. Routing i nawigacja

### 7.1 System routingu
Aplikacja używa systemu routingu z `utopia_arch`:
- `AppRouting` - centralna konfiguracja tras
- `RouteConfig` - konfiguracja tras z typem (material)
- Obserwatorzy nawigacji

### 7.2 Zdefiniowane trasy
- `/splash` - ekran powitalny (trasa początkowa)
- `/radio` - główny ekran radia
- `/connectivity` - ekran braku połączenia (nieużywany w routingu, ale istnieje)

### 7.3 RouterState
Globalny stan routera zarządzany przez hook `useRouterState`.

## 8. Zarządzanie stanem

### 8.1 Wzorzec zarządzania stanem
Aplikacja używa custom hooks i computed states:
- **Hooks** - `useAudioState`, `useRadioScreenState`, etc.
- **Computed States** - automatyczne przeliczanie stanów
- **Mutable States** - stany zmienne
- **Stream Subscriptions** - subskrypcje strumieni

### 8.2 Główne stany
- **AudioState** - stan odtwarzacza audio
- **InitializationState** - stan inicjalizacji aplikacji
- **ConnectivityState** - stan połączenia sieciowego
- **RouterState** - stan routera
- **ImagePrecacheState** - stan preładowania obrazów

### 8.3 Result Pattern
Aplikacja używa wzorca Result dla obsługi błędów:
- `ApiResult<T>` - wynik operacji API
- `ApiResultData<T>` - sukces z danymi
- `ApiResultError<T>` - błąd z wyjątkiem i stack trace

## 9. Obsługa audio

### 9.1 Biblioteki audio
- **just_audio** - główna biblioteka do odtwarzania
  - Obsługa strumieni HLS
  - `AudioPlayer` - główna klasa odtwarzacza
  - `AudioSource.uri()` - źródło audio z URI

- **audio_service** - obsługa w tle
  - `BaseAudioHandler` - bazowa klasa handlera
  - `AudioServiceConfig` - konfiguracja
  - Powiadomienia systemowe
  - Kontrolki multimedialne

### 9.2 Format strumienia
- **HLS (HTTP Live Streaming)** - format strumienia
- **M3U8** - format playlisty HLS
- URL: `https://project.office.utopiasoft.io/hls/projectslav/live.m3u8`

### 9.3 Funkcjonalności audio
- Odtwarzanie strumienia HLS
- Kontrola odtwarzania (play/pause/stop)
- Automatyczne wznowienie po przerwie
- Obsługa buforowania
- Synchronizacja stanu z UI
- Powiadomienia systemowe z informacją o utworze

## 10. Interfejs użytkownika

### 10.1 Motyw aplikacji
- **Ciemny motyw** (`appTheme`)
- Kolory zdefiniowane w `AppColors`
- Material Design 3

### 10.2 Główne komponenty UI
- **Animowana płyta winylowa** (Rive)
  - State machine: "Vinyl State"
  - Inputs: "Spin Record", "On / Off", "Move Needle"
  - Reaguje na stan odtwarzania

- **Dynamiczny przycisk Play/Pause**
  - Zmienia kształt (okrągły → prostokątny)
  - Zmienia pozycję (środek → góra)
  - Animacje przejścia
  - Wyświetla tytuł utworu podczas odtwarzania

- **RadioScreenLiveTitle**
  - Widget wyświetlający tytuł utworu
  - Wskaźnik "na żywo"

### 10.3 Responsive Design
- Automatyczne dostosowanie do różnych rozmiarów ekranów
- Użycie `SafeArea` dla bezpiecznych obszarów
- Elastyczne layouty

## 11. Lokalizacja

### 11.1 System lokalizacji
- Używa `utopia_localization_utils`
- Generator lokalizacji: `utopia_localization_generator`
- Pliki: `app_localizations.dart`, `app_localizations.g.dart`

### 11.2 Język
- Główny język: **Polski**
- Wszystkie komunikaty i teksty w języku polskim

## 12. Obsługa błędów i logowanie

### 12.1 System raportowania
- `AppReporter` - główny reporter
- `PrefixedReporter` - reporter z prefiksem
- Integracja z Firebase Crashlytics (`utopia_firebase_crashlytics`)

### 12.2 Obsługa błędów UI
- `AppGlobalErrorDialog` - globalne okno dialogowe błędów
- Specjalna obsługa błędów audio (PlatformException "Source error")
- Pomijanie błędów asercji w trybie debug

### 12.3 Logowanie
- Poziomy: info, warning, error
- Kontekstowe logowanie z prefiksami
- Stack traces dla błędów

## 13. Konfiguracja dla różnych platform

### 13.1 Android
**AndroidManifest.xml:**
- `android:launchMode="singleTop"` - tryb uruchomienia
- `android:hardwareAccelerated="true"` - akceleracja sprzętowa
- Konfiguracja tematów (LaunchTheme, NormalTheme)
- Intent filters dla launchera

**Wymagane uprawnienia:**
- Internet (domyślnie w Flutter)
- Odtwarzanie w tle (przez `audio_service`)

### 13.2 iOS
**Info.plist:**
- `UISupportedInterfaceOrientations` - obsługiwane orientacje
- `UILaunchStoryboardName` - ekran startowy
- `CADisableMinimumFrameDurationOnPhone` - optymalizacja wydajności

**Wymagane uprawnienia:**
- Background modes (audio) - przez `audio_service`

### 13.3 Web
**index.html:**
- Meta tagi dla PWA
- Ikony dla różnych urządzeń
- Manifest link

**manifest.json:**
- Konfiguracja PWA
- Ikony aplikacji
- Nazwa i opis

### 13.4 Desktop (Windows, macOS, Linux)
- Konfiguracja przez CMakeLists.txt (Windows, Linux)
- Konfiguracja przez Xcode project (macOS)
- Ikony aplikacji
- Konfiguracja okien

## 14. Integracje zewnętrzne

### 14.1 API zewnętrzne
- **AzuraCast API** - pobieranie informacji o utworze
  - Endpoint: `/api/nowplaying/projectslav`
  - Format: JSON
  - Dane: tytuł utworu, okładka

### 14.2 Storage
- **Supabase Storage** - przechowywanie okładek
  - URL: `https://hrtreeyiexbdvnlvzyjn.supabase.co/storage/v1/object/public/`
  - Bucket: "default"
  - Ścieżka: "covers/"

### 14.3 Dokumentacja zewnętrzna
- **Privacy Policy**: Flycricket hosting
- **Terms of Use**: Flycricket hosting

## 15. Cykl życia aplikacji

### 15.1 Inicjalizacja
1. `App.run()` - uruchomienie aplikacji
2. Inicjalizacja Rive
3. Inicjalizacja Flutter binding
4. Uruchomienie aplikacji z reporterem błędów
5. Inicjalizacja providerów
6. Sprawdzenie połączenia sieciowego
7. Inicjalizacja audio handlera
8. Przekierowanie do ekranu głównego

### 15.2 Zarządzanie cyklem życia
- `useAppLifecycleState()` - hook do monitorowania cyklu życia
- Specjalna obsługa dla Androida (zatrzymanie przy `detached`)
- Automatyczne zarządzanie zasobami audio

## 16. Optymalizacje i best practices

### 16.1 Optymalizacje wydajności
- Użycie `useMemoized` dla kosztownych obliczeń
- `useAutoComputedState` dla automatycznego przeliczania
- Stream subscriptions z automatycznym dispose
- Precache obrazów (`ImagePrecacheState`)

### 16.2 Best practices
- Separation of concerns (logika/widok)
- Dependency Injection
- Result pattern dla błędów
- Immutable collections
- Type safety (Dart 3.9+)
- Code generation dla boilerplate

## 17. Testowanie

### 17.1 Dostępne narzędzia
- `flutter_test` - framework testowy
- Możliwość testów jednostkowych
- Możliwość testów widgetów

### 17.2 Testy (obecny stan)
- Brak zaimplementowanych testów w projekcie
- Możliwość dodania testów dla:
  - Stanów (AudioState, RadioScreenState)
  - Serwisów (RadioApiService, BackgroundAudioService)
  - Widgetów (RadioScreen, SplashScreen)

## 18. Wersjonowanie

### 18.1 Wersja aplikacji
- Wersja w `pubspec.yaml`: `1.0.0+1`
- Wersja w `AppConfig`: `1.0.3`

### 18.2 Konfiguracje
- Obecnie tylko konfiguracja `dev`
- Możliwość rozszerzenia o `prod`, `staging`

## 19. Uwagi techniczne

### 19.1 Ograniczenia
- Aplikacja wymaga stałego połączenia z Internetem
- Brak możliwości odtwarzania offline
- Brak cache'owania strumienia
- Ograniczona funkcjonalność (tylko play/pause)

### 19.2 Możliwości rozbudowy
- Cache strumienia
- Lista ulubionych stacji
- Historia odtwarzanych utworów
- Ustawienia użytkownika
- Różne źródła strumieni
- Ekualizer
- Sleep timer

## 20. Podsumowanie techniczne

### 20.1 Kluczowe technologie
- **Flutter 3.10+** - framework UI
- **Dart 3.9.0+** - język programowania
- **just_audio** - odtwarzanie audio
- **audio_service** - odtwarzanie w tle
- **utopia_arch** - architektura aplikacji
- **Rive** - animacje

### 20.2 Architektura
- Hooks-based architecture
- Dependency Injection
- State Management przez custom hooks
- Separation of Concerns

### 20.3 Platformy
- Android (7.0+)
- iOS (12+)
- Web
- Windows (10+)
- macOS (10.14+)
- Linux

### 20.4 Główne funkcjonalności
- Odtwarzanie strumienia HLS
- Odtwarzanie w tle
- Powiadomienia systemowe
- Wyświetlanie informacji o utworze
- Obsługa połączenia sieciowego
- Responsive UI

## 21. Informacje dla pracy inżynierskiej

### 21.1 Kluczowe aspekty do opisania
1. **Multiplatformowość Flutter**
   - Jeden kod dla wielu platform
   - Konfiguracja dla każdej platformy
   - Różnice w implementacji (np. odtwarzanie w tle)

2. **Architektura aplikacji**
   - Wzorzec hooks-based
   - Dependency Injection
   - Zarządzanie stanem

3. **Odtwarzanie audio**
   - Integracja z `just_audio`
   - Obsługa HLS
   - Odtwarzanie w tle przez `audio_service`

4. **Adaptacja interfejsu**
   - Responsive design
   - Różne rozmiary ekranów
   - Adaptacja do platform (mobilne/desktop/web)

5. **Obsługa błędów i stanów**
   - Result pattern
   - Globalne obsługa błędów
   - Obsługa połączenia sieciowego

6. **Konfiguracja platform**
   - Android (AndroidManifest.xml)
   - iOS (Info.plist)
   - Web (index.html, manifest.json)
   - Desktop (CMakeLists.txt, Xcode)

### 21.2 Wykresy i diagramy do stworzenia
1. **Diagram architektury aplikacji**
   - Warstwy (UI, State, Service, Model)
   - Zależności między komponentami

2. **Diagram przepływu danych**
   - Inicjalizacja aplikacji
   - Odtwarzanie audio
   - Pobieranie informacji o utworze

3. **Diagram stanów**
   - Stany odtwarzacza audio
   - Stany aplikacji
   - Stany połączenia sieciowego

4. **Diagram przypadków użycia**
   - Odtwarzanie strumienia
   - Zatrzymanie odtwarzania
   - Obsługa błędów

### 21.3 Zrzuty ekranu do przygotowania
1. Ekran powitalny (Splash Screen)
2. Główny ekran radia (przed odtwarzaniem)
3. Główny ekran radia (podczas odtwarzania)
4. Ekran błędu połączenia
5. Powiadomienie systemowe (Android/iOS)
6. Aplikacja na różnych platformach (mobilne/desktop/web)

### 21.4 Testy do przeprowadzenia
1. **Testy funkcjonalne**
   - Odtwarzanie strumienia
   - Zatrzymanie odtwarzania
   - Obsługa błędów połączenia
   - Odtwarzanie w tle

2. **Testy wydajnościowe**
   - Czas uruchomienia aplikacji
   - Czas rozpoczęcia odtwarzania
   - Zużycie pamięci
   - Zużycie baterii

3. **Testy na różnych platformach**
   - Android (różne wersje)
   - iOS (różne wersje)
   - Web (różne przeglądarki)
   - Desktop (Windows, macOS, Linux)

4. **Testy responsywności**
   - Różne rozmiary ekranów
   - Różne orientacje
   - Różne rozdzielczości

### 21.5 Wnioski do wyciągnięcia
1. **Zalety Flutter dla multiplatformowości**
   - Jeden kod dla wielu platform
   - Szybki rozwój
   - Spójny wygląd

2. **Wyzwania**
   - Różnice między platformami
   - Konfiguracja dla każdej platformy
   - Ograniczenia niektórych platform

3. **Osiągnięcia**
   - Działanie na 6 platformach
   - Spójny interfejs
   - Wydajne odtwarzanie audio

4. **Możliwości rozwoju**
   - Rozszerzenie funkcjonalności
   - Optymalizacja wydajności
   - Dodatkowe platformy (smartwatch, TV)
