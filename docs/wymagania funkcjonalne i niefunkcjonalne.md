# 1 Wstęp

Wstęp do pracy “Flutter jako narzędzie do tworzenia aplikacji multiplatformowych – studium
przypadku”.

# 2 Przeglad istniejących rozwiazan

Podać kilka przykładów – wymienić wady i zalety (podać odsyłacze do stron)

# 3 Analiza zapotrzebowań

Etap analizy zapotrzebowań ma na celu określenie potrzeb użytkownika końcowego oraz
zdefiniowanie warunków technicznych, jakie musi spełniać tworzona aplikacja. Jest to
kluczowy krok w procesie projektowania oprogramowania, który pozwala precyzyjnie
określić, jakie funkcje powinien realizować system, a także w jakich warunkach powinien on
działać.

Analiza zapotrzebowań obejmuje zarówno wymagania funkcjonalne, określające konkretne
możliwości i działania aplikacji z punktu widzenia użytkownika, jak i wymagania
niefunkcjonalne, odnoszące się do parametrów jakościowych, ograniczeń sprzętowych,
platformowych czy wydajnościowych.

W przypadku aplikacji służącej do odbioru strumienia audio z autorskiego serwera
radiowego, szczególne znaczenie mają aspekty związane z kompatybilnością
wieloplatformową, płynnością odtwarzania oraz odpornością na błędy połączenia.
Zdefiniowanie tych wymagań pozwala na stworzenie rozwiązania spełniającego założenia
techniczne i użytkowe, a także ułatwia późniejsze testowanie oraz ocenę poprawności
działania systemu.

## 3.1 Wymagania niefunkcjonalne

Wymagania niefunkcjonalne określają warunki, jakie musi spełniać środowisko sprzętowe i
programowe w celu prawidłowego działania aplikacji. Dotyczą one przede wszystkim
kompatybilności systemowej, stabilności, dostępności zasobów systemowych oraz jakości
działania, a nie konkretnych funkcji użytkowych.


Sprzęt i zasoby systemowe:

- Urządzenie końcowe (np. smartfon, komputer, tablet, smartwatch) powinno być
    wyposażone w aktywne połączenie z Internetem.
- W przypadku urządzeń stacjonarnych (desktop/laptop) wymagany jest system operacyjny
    zgodny z jedną z obsługiwanych przez Flutter platform (Windows 10+, macOS 10.14+,
    wybrane dystrybucje Linux).
- W przypadku przeglądarki internetowej rekomenduje się korzystanie z aktualnej wersji
    jednego z następujących programów:
o Google Chrome (minimum wersja 80)
o Mozilla Firefox (minimum wersja 75)
o Microsoft Edge (Chromium-based)
o Safari (minimum wersja 13)
- Urządzenie musi umożliwiać odtwarzanie dźwięku przez zintegrowany lub zewnętrzny
    układ audio.

Środowisko programistyczne i biblioteki:

- Aplikacja została stworzona z wykorzystaniem środowiska Flutter (minimum wersja
    3.10) oraz języka programowania Dart.
- Do obsługi streamingu wykorzystywana jest biblioteka just_audio (lub inna
    równoważna), obsługująca odtwarzanie strumieni HLS/MP3.
- Kod źródłowy aplikacji powinien być możliwy do skompilowania z wykorzystaniem
    oficjalnego zestawu SDK Flutter bez konieczności instalowania dodatkowych narzędzi
    zewnętrznych.

Kompatybilność systemowa:

- Kod aplikacji powinien być w miarę możliwości wspólny dla wszystkich platform, z
    ewentualnymi wyjątkami uzasadnionymi ograniczeniami systemowymi (np. różnice w
    działaniu paneli multimedialnych).
- Aplikacja powinna być możliwa do uruchomienia na następujących platformach:


```
o Android – od wersji 7.0 (Nougat)
o iOS – od wersji 12.
o Web – aktualne przeglądarki wspierane przez Flutter Web
o Windows – od wersji 10
o macOS – od wersji 10.14 (Mojave)
o Linux – zgodne dystrybucje z obsługą Flutter Desktop
```
Jakość działania:

- Aplikacja powinna uruchamiać się w czasie nie dłuższym niż 3 sekundy na urządzeniach
    referencyjnych.
- Odtwarzanie strumienia powinno rozpoczynać się w czasie nie dłuższym niż 2 sekundy
    od momentu kliknięcia przycisku _Play_ , przy stabilnym połączeniu sieciowym.
- System powinien być odporny na krótkotrwałe przerwy w dostępie do Internetu.
    Strumień powinien automatycznie próbować wznowić połączenie bez potrzeby
    ingerencji użytkownika.

## 3.2 Wymagania funkcjonalne

Tworzona aplikacja ma na celu umożliwienie użytkownikowi odsłuchiwania całodobowego
strumienia audio z autorskiego internetowego radia, nadawanego przy użyciu
oprogramowania AzuraCast. Projekt zakłada minimalistyczny, lecz funkcjonalny interfejs,
który będzie dostępny na wielu platformach systemowych. Zakres funkcjonalności został
ograniczony do kluczowych elementów związanych z odbiorem i kontrolą strumienia, tak aby
skupić się na analizie technicznych możliwości środowiska Flutter w kontekście budowy
aplikacji multiplatformowej.

Użytkownik nie musi zakładać konta, logować się ani przechodzić przez proces konfiguracji.
Dostęp do transmisji jest prosty, szybki i możliwy bezpośrednio po uruchomieniu aplikacji.
Obsługa interfejsu ogranicza się do pojedynczego przycisku umożliwiającego odtwarzanie lub
zatrzymanie transmisji. Istotnym założeniem projektu jest także zapewnienie działania
aplikacji w tle, co pozwala na dalsze korzystanie z urządzenia przy jednoczesnym słuchaniu
audycji.


W dalszej części rozdziału przedstawiono szczegółowe wymagania funkcjonalne, które
zostały podzielone na poszczególne aspekty działania aplikacji, zarówno z perspektywy
użytkownika, jak i od strony systemowej.

- Aplikacja powinna umożliwiać użytkownikowi rozpoczęcie odtwarzania strumienia
    radiowego poprzez jednoznacznie oznaczony przycisk _Play_ widoczny na ekranie
    głównym. Odtwarzanie nie powinno rozpoczynać się automatycznie po uruchomieniu
    aplikacji.
o Użytkownik powinien mieć możliwość zatrzymania i wznowienia odtwarzania w
dowolnym momencie za pomocą tego samego przycisku, który dynamicznie zmienia
swoją ikonę ( _Play_ - _Pause_ ) w zależności od stanu strumienia.
- Aplikacja powinna wspierać działanie w tle. Użytkownik powinien móc korzystać z
    innych funkcji urządzenia przy jednoczesnym odtwarzaniu strumienia.
o Aplikacja powinna umożliwiać kontynuację odtwarzania przy zablokowanym ekranie
(o ile zezwala na to system operacyjny).
o W trakcie działania aplikacji w tle lub na zablokowanym ekranie, system powinien
wyświetlać tytuł aktualnie odtwarzanego utworu oraz grafikę okładki przesyłaną ze
strumienia.
- Ekran powitalny ( _splash screen_ ) powinien pojawiać się podczas uruchamiania i
    inicjalizacji aplikacji.
o W trakcie działania ekranu powitalnego aplikacja powinna wykonać wszystkie
niezbędne operacje inicjalizacyjne, takie jak: uruchomienie silnika Fluttera,
przygotowanie kontekstu graficznego, sprawdzenie dostępności połączenia sieciowego
oraz wstępna inicjalizacja komponentu odpowiedzialnego za streaming audio. Po
zakończeniu tych czynności użytkownik powinien zostać automatycznie
przekierowany do ekranu głównego.
- Aplikacja powinna być w stanie wykryć problemy z połączeniem sieciowym lub
    strumieniem (np. brak Internetu, niedostępność serwera) i w takich przypadkach
    wyświetlać czytelne komunikaty o błędach.
o W przypadku problemów z połączeniem aplikacja powinna automatycznie
podejmować próby ponownego połączenia, bez potrzeby ingerencji użytkownika.
- Aplikacja powinna prawidłowo reagować na zmiany w przesyłanym strumieniu -
    aktualizować tytuł utworu, okładkę oraz reagować na ewentualne przerwy w transmisji.


- Wszystkie komunikaty i treści interfejsu powinny być w języku polskim, włącznie z
    opisami przycisków, komunikatami błędów i statusami połączenia.
- Interfejs użytkownika powinien być uproszczony i intuicyjny, dostosowany do urządzeń
    mobilnych i desktopowych, z dużym czytelnym przyciskiem sterującym i ewentualnym
    napisem informującym o statusie połączenia lub odtwarzania.
- Układ graficzny ( _layout_ ) powinien automatycznie dostosowywać się do różnych
    rozmiarów ekranów ( _responsive design_ ) oraz rozdzielczości ekranów (np. smartfon,
    tablet, komputer).
- Kod źródłowy aplikacji powinien być czytelnie podzielony na moduły, rozdzielające
    logikę aplikacji od warstwy interfejsu oraz odpowiedzialne za obsługę streamingu,
    błędów i platform.
- Strumień będzie pochodzić z autorskiego serwera radiowego działającego w oparciu o
    oprogramowanie AzuraCast, uruchomionego na własnym serwerze autora pracy.
- Nadawany strumień będzie dostępny 24 godziny na dobę, 7 dni w tygodniu, a jego
    zawartość będzie składać się z utworów objętych darmową licencją lub należących do
    domeny publicznej.


