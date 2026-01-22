# Schemat pracy i spis treści

## Schemat pracy

Praca inżynierska na temat "Flutter jako narzędzie do tworzenia aplikacji multiplatformowych – studium przypadku" będzie składać się z następujących rozdziałów:

1. **Wstęp** - motywacja podjęcia tematu, wprowadzenie do problematyki
2. **Cel pracy** - jedno konkretne zdanie określające cel pracy
3. **Przegląd istniejących rozwiązań** - analiza podobnych aplikacji i technologii
4. **Analiza zapotrzebowań** - szczegółowa analiza wymagań funkcjonalnych i niefunkcjonalnych
5. **Projektowanie** - modele, diagramy, architektura rozwiązania
6. **Implementacja** - opis procesu implementacji aplikacji
7. **Działanie aplikacji** - prezentacja funkcjonalności z zrzutami ekranu
8. **Testy** - testy funkcjonalne, wydajnościowe, użyteczności
9. **Podsumowanie** - podsumowanie osiągnięć i wnioski
10. **Dalsze możliwości rozwoju** - propozycje rozbudowy
11. **Bibliografia** - źródła wykorzystane w pracy

---

## Spis treści

### 1. Wstęp

- Motywacja podjęcia tematu
- Wprowadzenie do problematyki aplikacji multiplatformowych
- Znaczenie frameworka Flutter w kontekście cross-platform development
- Krótki opis projektu (aplikacja do odtwarzania radia internetowego)
- Struktura pracy

### 2. Cel pracy

**Cel pracy** (w ramce z cieniem 1.25pt):
*Stworzenie i skonfigurowanie aplikacji do odtwarzania strumienia radiowego HLS na jak największej liczbie platform przy użyciu frameworka Flutter, wraz z analizą procesu adaptacji interfejsu i funkcjonalności na różne systemy operacyjne.*

- Objaśnienie celu pracy
- Zakres pracy
- Metody badawcze

### 3. Przegląd istniejących rozwiązań

#### 3.1. Frameworki do tworzenia aplikacji multiplatformowych
- React Native
- Xamarin
- Flutter
- Porównanie wad i zalet

#### 3.2. Aplikacje do odtwarzania radia internetowego
- Przykłady istniejących aplikacji mobilnych
- Przykłady aplikacji desktopowych
- Przykłady aplikacji webowych
- Analiza wad i zalet różnych rozwiązań

#### 3.3. Technologie streamingowe
- HLS (HTTP Live Streaming)
- MP3 streaming
- Porównanie formatów

#### 3.4. Biblioteki do odtwarzania audio w Flutter
- just_audio
- audioplayers
- audio_service
- Porównanie funkcjonalności

### 4. Analiza zapotrzebowań

#### 4.1. Wprowadzenie do analizy zapotrzebowań
- Cel analizy zapotrzebowań
- Metody zbierania wymagań
- Klasyfikacja wymagań

#### 4.2. Wymagania niefunkcjonalne

##### 4.2.1. Sprzęt i zasoby systemowe
- Wymagania dotyczące urządzeń końcowych
- Wymagania dotyczące połączenia sieciowego
- Wymagania dotyczące systemów operacyjnych
- Wymagania dotyczące przeglądarek internetowych

##### 4.2.2. Środowisko programistyczne i biblioteki
- Wymagania dotyczące Flutter SDK
- Wymagania dotyczące języka Dart
- Wymagania dotyczące bibliotek zewnętrznych
- Wymagania dotyczące narzędzi deweloperskich

##### 4.2.3. Kompatybilność systemowa
- Obsługiwane platformy mobilne (Android, iOS)
- Obsługiwane platformy desktopowe (Windows, macOS, Linux)
- Obsługiwane platformy webowe
- Wspólny kod vs. kod specyficzny dla platformy

##### 4.2.4. Jakość działania
- Wymagania dotyczące czasu uruchomienia
- Wymagania dotyczące czasu rozpoczęcia odtwarzania
- Wymagania dotyczące odporności na błędy połączenia
- Wymagania dotyczące stabilności

#### 4.3. Wymagania funkcjonalne

##### 4.3.1. Odtwarzanie strumienia radiowego
- Rozpoczęcie odtwarzania strumienia HLS
- Zatrzymanie i wznowienie odtwarzania
- Kontrola odtwarzania (przycisk Play/Pause)
- Automatyczne wznowienie po przerwie w połączeniu

##### 4.3.2. Odtwarzanie w tle
- Działanie aplikacji w tle
- Odtwarzanie przy zablokowanym ekranie
- Powiadomienia systemowe z informacją o utworze
- Wyświetlanie okładki w powiadomieniu

##### 4.3.3. Wyświetlanie informacji o utworze
- Pobieranie aktualnie odtwarzanego utworu z API
- Wyświetlanie tytułu utworu
- Wyświetlanie okładki utworu
- Aktualizacja informacji w czasie rzeczywistym

##### 4.3.4. Obsługa połączenia sieciowego
- Wykrywanie braku połączenia z Internetem
- Automatyczne zatrzymanie odtwarzania przy braku Internetu
- Wyświetlanie komunikatu o braku połączenia
- Automatyczne próby ponownego połączenia

##### 4.3.5. Interfejs użytkownika
- Ekran powitalny (Splash Screen)
- Ekran główny z kontrolą odtwarzania
- Animowana płyta winylowa
- Responsive design
- Ciemny motyw

##### 4.3.6. Obsługa błędów
- Wyświetlanie komunikatów o błędach
- Obsługa błędów połączenia
- Obsługa błędów strumienia
- Logowanie błędów

#### 4.4. Diagram przypadków użycia
- Opis notacji UML (odsyłacz do literatury)
- Diagram główny przypadków użycia
- Opis aktorów
- Opis przypadków użycia

#### 4.5. Scenariusze przypadków użycia

##### UC01: Rozpoczęcie odtwarzania strumienia
- Warunki początkowe
- Przebieg podstawowy
- Przebieg alternatywny

##### UC02: Zatrzymanie odtwarzania
- Warunki początkowe
- Przebieg podstawowy
- Przebieg alternatywny

##### UC03: Odtwarzanie w tle
- Warunki początkowe
- Przebieg podstawowy
- Przebieg alternatywny

##### UC04: Obsługa braku połączenia sieciowego
- Warunki początkowe
- Przebieg podstawowy
- Przebieg alternatywny

#### 4.6. Model statyczny
- Diagram klas głównych komponentów
- Opis klas i ich relacji
- Model danych (SongModel, ApiResult)

#### 4.7. Model dynamiczny
- Diagramy sekwencji dla kluczowych operacji
- Diagram stanów odtwarzacza audio
- Diagram przepływu danych

### 5. Projektowanie

#### 5.1. Architektura aplikacji
- Wzorzec architektoniczny (hooks-based architecture)
- Dependency Injection
- Zarządzanie stanem
- Separation of Concerns

#### 5.2. Struktura projektu
- Organizacja folderów
- Podział na moduły
- Struktura plików

#### 5.3. Wybór technologii
- Uzasadnienie wyboru Flutter
- Uzasadnienie wyboru bibliotek
- Uzasadnienie wyboru architektury

### 6. Implementacja

#### 6.1. Projekt bazy danych
- *Brak bazy danych w projekcie - aplikacja nie wymaga przechowywania danych lokalnie*

#### 6.2. Narzędzia programistyczne

##### 6.2.1. Środowisko deweloperskie
- Flutter SDK (wersja 3.10+)
- Dart (wersja 3.9.0+)
- Android Studio / Visual Studio Code
- Git

##### 6.2.2. Biblioteki i zależności
- utopia_arch - architektura aplikacji
- just_audio - odtwarzanie audio
- audio_service - odtwarzanie w tle
- dio - komunikacja HTTP
- rive - animacje
- Inne biblioteki (z odsyłaczami do dokumentacji)

##### 6.2.3. Narzędzia pomocnicze
- build_runner - generowanie kodu
- freezed - niezmienne klasy
- json_serializable - serializacja JSON

#### 6.3. Opis implementacji

##### 6.3.1. Inicjalizacja aplikacji
- Struktura głównego pliku (main.dart)
- Konfiguracja aplikacji (App class)
- Inicjalizacja providerów
- Routing

##### 6.3.2. Zarządzanie stanem
- Implementacja AudioState
- Implementacja InitializationState
- Implementacja ConnectivityState
- Custom hooks

##### 6.3.3. Obsługa audio
- Implementacja BackgroundAudioHandler
- Integracja z just_audio
- Integracja z audio_service
- Obsługa strumienia HLS

##### 6.3.4. Interfejs użytkownika
- Implementacja SplashScreen
- Implementacja RadioScreen
- Animacja płyty winylowej (Rive)
- Responsive design

##### 6.3.5. Komunikacja z API
- Implementacja RadioApiService
- Obsługa błędów sieciowych
- Parsowanie odpowiedzi API

##### 6.3.6. Obsługa błędów
- Globalne okno dialogowe błędów
- Specjalna obsługa błędów audio
- Logowanie błędów

##### 6.3.7. Konfiguracja dla różnych platform

###### Android
- AndroidManifest.xml
- Konfiguracja uprawnień
- Konfiguracja powiadomień

###### iOS
- Info.plist
- Konfiguracja uprawnień
- Konfiguracja orientacji ekranu

###### Web
- index.html
- manifest.json
- Konfiguracja PWA

###### Desktop (Windows, macOS, Linux)
- CMakeLists.txt (Windows, Linux)
- Konfiguracja Xcode (macOS)
- Ikony aplikacji

#### 6.4. Adaptacja interfejsu na różne platformy
- Responsive design
- Adaptacja do różnych rozmiarów ekranów
- Różnice w implementacji między platformami
- Wspólny kod vs. kod specyficzny dla platformy

### 7. Działanie aplikacji

#### 7.1. Ekran powitalny
- Opis funkcjonalności
- Ilustracja 1: Ekran powitalny aplikacji
- Proces inicjalizacji

#### 7.2. Ekran główny - przed odtwarzaniem
- Opis interfejsu
- Ilustracja 2: Ekran główny przed rozpoczęciem odtwarzania
- Przycisk Play

#### 7.3. Ekran główny - podczas odtwarzania
- Opis interfejsu podczas odtwarzania
- Ilustracja 3: Ekran główny podczas odtwarzania
- Animacja płyty winylowej
- Wyświetlanie tytułu utworu

#### 7.4. Odtwarzanie w tle
- Opis funkcjonalności
- Ilustracja 4: Powiadomienie systemowe na Androidzie
- Ilustracja 5: Powiadomienie systemowe na iOS
- Kontrolki multimedialne

#### 7.5. Obsługa błędów
- Opis obsługi błędów
- Ilustracja 6: Ekran błędu połączenia
- Komunikaty błędów

#### 7.6. Aplikacja na różnych platformach
- Ilustracja 7: Aplikacja na Androidzie
- Ilustracja 8: Aplikacja na iOS
- Ilustracja 9: Aplikacja na Web
- Ilustracja 10: Aplikacja na Windows
- Ilustracja 11: Aplikacja na macOS
- Ilustracja 12: Aplikacja na Linux

#### 7.7. Kluczowe fragmenty kodu
- Przykład implementacji AudioState
- Przykład implementacji BackgroundAudioHandler
- Przykład implementacji RadioScreen
- Przykład konfiguracji dla platformy

### 8. Testy

#### 8.1. Testy funkcjonalne
- Testy odtwarzania strumienia
- Testy kontroli odtwarzania
- Testy odtwarzania w tle
- Testy obsługi błędów
- Testy obsługi połączenia sieciowego

#### 8.2. Testy wydajnościowe
- Czas uruchomienia aplikacji
- Czas rozpoczęcia odtwarzania
- Zużycie pamięci
- Zużycie baterii
- Wykresy wydajności
- Wnioski autorskie

#### 8.3. Testy na różnych platformach
- Testy na Androidzie (różne wersje)
- Testy na iOS (różne wersje)
- Testy na Web (różne przeglądarki)
- Testy na Windows
- Testy na macOS
- Testy na Linux

#### 8.4. Testy responsywności
- Testy na różnych rozmiarach ekranów
- Testy na różnych orientacjach
- Testy na różnych rozdzielczościach

#### 8.5. Testy użyteczności (heurystyki Jacoba Nielsena)
- Widoczność statusu systemu
- Zgodność systemu ze światem rzeczywistym
- Kontrola użytkownika i wolność
- Spójność i standardy
- Zapobieganie błędom
- Rozpoznawanie zamiast przypominania
- Elastyczność i efektywność użycia
- Estetyczny i minimalistyczny design
- Pomoc użytkownikom w rozpoznawaniu, diagnozowaniu i naprawianiu błędów
- Pomoc i dokumentacja

### 9. Podsumowanie

#### 9.1. Realizacja celu pracy
- Opis co zostało zrobione w poszczególnych rozdziałach
- Wykazanie, że cel pracy został osiągnięty
- Podsumowanie osiągnięć

#### 9.2. Wnioski
- Zalety Flutter dla aplikacji multiplatformowych
- Wyzwania napotkane podczas implementacji
- Różnice między platformami
- Wspólny kod vs. kod specyficzny dla platformy
- Wydajność aplikacji
- Jakość kodu

#### 9.3. Osiągnięcia
- Działanie aplikacji na 6 platformach (Android, iOS, Web, Windows, macOS, Linux)
- Spójny interfejs użytkownika
- Wydajne odtwarzanie audio
- Odtwarzanie w tle
- Responsive design

### 10. Dalsze możliwości rozwoju

#### 10.1. Funkcjonalności z wymagań nie zaimplementowane
- Lista funkcjonalności z wymagań, które nie zostały zaimplementowane
- Uzasadnienie braku implementacji

#### 10.2. Propozycje rozbudowy
- Cache strumienia
- Lista ulubionych stacji
- Historia odtwarzanych utworów
- Ustawienia użytkownika
- Różne źródła strumieni
- Ekualizer
- Sleep timer
- Obsługa smartwatch
- Obsługa TV (Android TV, tvOS)

### 11. Bibliografia

- Lista numerowana źródeł wykorzystanych w pracy
- Książki
- Artykuły naukowe
- Dokumentacja techniczna
- Strony internetowe
- Standardy i specyfikacje

---

## Uwagi dotyczące formatowania

### Style tekstu
- **Tekst podstawowy**: Styl "TextPodst" - czcionka Times New Roman, interlinia 1.5, odstęp po 6pt, BEZ wcięcia pierwszego wiersza
- **Nagłówki**: Nagłówek 1, Nagłówek 2, Nagłówek 3 (zdefiniowane w szkicu)
- **Kod źródłowy**: Czcionka Calibri lub Consolas 11pt, interlinia pojedyncza
- **Kursywy**: Tylko dla angielskich terminów, np. _Use Case_

### Ilustracje
- Podpisy: "Ilustracja <numer>. <opis>"
- Czcionka podpisów: Times New Roman 10pt Bold, akapit wyśrodkowany
- Odsyłacze w tekście do każdej ilustracji
- Ilustracje "Równo z tekstem" w osobnym akapicie wyśrodkowane

### Tabele
- Podpisy nad tabelą: "Tab <numer>. <opis>"
- Czcionka podpisów: Times New Roman 10pt Bold, akapit wyśrodkowany

### Listy
- **Lista pierwszego poziomu**: Punktor 0.2cm, tekst 0.8cm (lub punktor 0.2cm, tekst odsunięty od punktora o 0.6cm)
- **Lista drugiego poziomu**: Punktor 0.6cm, tekst 1.2cm (lub punktor 0.6cm, tekst odsunięty od punktora o 0.6cm)
- **Lista numerowana**: Standardowa numeracja

### Cel pracy
- Umieszczony w ramce z cieniem (1.25pt)
- Jedno bardzo konkretne zdanie
- Poniżej można dodać objaśnienia

---

## Estymowana objętość rozdziałów

1. **Wstęp** - ~2-3 strony
2. **Cel pracy** - ~0.5-1 strona
3. **Przegląd istniejących rozwiązań** - ~5-7 stron
4. **Analiza zapotrzebowań** - ~8-12 stron
5. **Projektowanie** - ~4-6 stron
6. **Implementacja** - ~15-20 stron
7. **Działanie aplikacji** - ~6-8 stron
8. **Testy** - ~5-7 stron
9. **Podsumowanie** - ~3-4 strony
10. **Dalsze możliwości rozwoju** - ~2-3 strony
11. **Bibliografia** - ~1-2 strony

**Szacunkowa całkowita objętość pracy: ~50-70 stron**

---

## Kluczowe słowa

Flutter, Dart, aplikacje mobilne, cross-platform, rozwój oprogramowania, programowanie aplikacji, adaptacja interfejsu na różne urządzenia, studium przypadku, Android, iOS, Windows, Linux, macOS, Web, smartwatch, TV, HLS, streaming audio, multiplatformowość
