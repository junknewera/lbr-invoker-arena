# Invoker Arena для Leaf Blower Revolution

Мод добавляет в LBR арену: ты Инвокер 30 лвла (все таланты, Аганим, сферы 9/9/9), напротив стоит Акс 30 лвла с 6 Heart of Tarrasque.
Цифры (кулдауны, урон, длительности) взяты из файлов Доты и её подсказок. Работает и на Linux (Steam + Proton), и на Windows.

## Быстрый старт
| | Linux | Windows |
|---|---|---|
| 1. Подготовка (один раз) | `./setup.sh` | `setup.cmd` (или `.\setup.ps1`) |
| 2. Сборка мода | `./build.sh` | `build.cmd` |
| 3a. Поставить в игру | `./install.sh` | `install.cmd` |
| 3b. …или запустить разово | параметры запуска Steam (ниже) | параметры запуска Steam (ниже) |
| Убрать мод | `./restore.sh` | `restore.cmd` |

`setup` сам находит игру через библиотеки Steam, скачивает UndertaleModTool CLI в `tools/` и делает бэкап оригинального `data.win` (если его ещё нет в `backup/`).
Если игра стоит в нестандартном месте — задай `LBR_GAME_DIR` (папка игры).
`install` перед установкой копирует сейвы в `backup/saves-<дата>` и откажется ставиться, если LBR обновилась (тогда: скопируй новый `data.win` в `backup/data.win.orig`, `build`, `install`).

### Разовый запуск без установки
Файлы игры не меняются. Steam → Leaf Blower Revolution → Свойства → Параметры запуска:
- Linux (Proton): `%command% -game "Z:\полный\путь\к\lbr-mod\out\data.win"` (например `Z:\home\<user>\lbr-mod\out\data.win`)
- Windows: `-game "C:\полный\путь\к\lbr-mod\out\data.win"`

Иконки и звуки берутся из `out/invoker_arena/` рядом с `out/data.win`. После записи сотри параметр — игра снова обычная.

## Управление (в игре нажми **I**)
| Клавиша | Действие |
|---|---|
| Q / W / E | Quas / Wex / Exort |
| F / R | спелл-слот 1 / 2 |
| D | Invoke |
| Z X C V CapsLock Space | Hex, Shiva, Refresher, Aghanim (пассивка), BKB, Blink |
| ПКМ | идти; ПКМ по Аксу — атаковать |
| двойное нажатие Sun Strike | Cataclysm (Аганим) |
| Backspace | сбросить Акса и все кулдауны |
| I | выйти из арены |

Спеллы кастуются в курсор (как quick cast). Пока арена открыта, хоткеи меню LBR и воздуходувка отключены.

## Важно
- Не играй с модом в сезонах: игра пишет лог кликов (`input_log`).
- Иконки и звуки — из Доты (Valve), `data.win` и декомпил — из LBR. Репозиторий приватный; не делай его публичным и не выкладывай сборку.
- Несколько механик — толкования (данных в Доте нет): см. `docs/loop_progress.md`.
- Под Proton замечена тряска экрана; причина не найдена (камера LBR в арене не двигается, встроенный screenshake не вызывается).

## Тесты
| | Linux | Windows |
|---|---|---|
| Юнит-тесты (55, в настоящем раннере LBR) | `./test.sh` — wine + Xvfb, без окна | `test.cmd` — окно игры мелькнёт на пару секунд |
| Сквозной тест (новая игра → арена → прокасты → скриншоты в `e2e/`) | `./e2e.sh` | нет |

Тестовая сборка останавливается сразу после тестов, до старта самой LBR, поэтому сейвы не трогает и на Windows.
Сквозной тест есть только на Linux: он запускает новую игру, а на Windows это была бы настоящая папка сейвов и Steam Cloud. На Linux у тестов свой wine-префикс `.wine/` без Steam.
Для тестов на Linux нужны wine, xvfb-run и ImageMagick (`import`).

## Скрипты
<!-- AUTO-GENERATED from the header comments of the scripts -->
| Linux | Windows | Что делает |
|---|---|---|
| `setup.sh` | `setup.ps1` / `.cmd` | One-time setup: downloads the UndertaleModTool CLI into tools/, backs up the original data.win and prepares testrun/ (a copy of the game used by the tests). |
| `build.sh` | `build.ps1` / `.cmd` | Builds the Invoker Arena mod: out/data.win from backup/data.win.orig, plus out/invoker_arena/ (icons and sounds) so the mod can also be started once through Steam launch options (-game ".../out/data.win"). |
| `test.sh` | `test.ps1` / `.cmd` | Builds a test data.win (src + tests) and runs it in the real GameMaker runner. |
| `e2e.sh` | — | End-to-end check: runs out/data.win headless (wine + Xvfb) with -inv_autotest, which starts a new game, enters the arena and plays a scripted combo; takes a screenshot each time the mod reports a new step (e2e/<step>.png). |
| `assets.sh` | — | Builds assets/invoker_arena/ (icons/*.png, sounds/*.ogg, vo/*.ogg). If assets_raw/ is missing, first extracts the Invoker icons/sounds from Dota's pak01_dir.vpk with Source 2 Viewer (tools/vrf). Needs ffmpeg. |
| `install.sh` | `install.ps1` / `.cmd` | Installs the Invoker Arena mod into the Steam copy of Leaf Blower Revolution: backs up the saves, replaces data.win with out/data.win and copies the icons/sounds folder next to it. |
| `restore.sh` | `restore.ps1` / `.cmd` | Removes the Invoker Arena mod: puts the original data.win back and deletes the icons/sounds folder. |
<!-- /AUTO-GENERATED -->

Готовые `assets/invoker_arena/` лежат в репозитории, так что `assets.sh` нужен только для пересборки иконок и звуков из Доты.
Переменные для ручной настройки: `LBR_GAME_DIR`, `LBR_SAVES_DIR`, `UTMT_CLI`, а на Linux ещё `DOTA_DIR` и `VRF_CLI`.

## Структура
- `src/` — правила и симуляция (чистый GML, покрыт тестами), `tests/` — тесты и мини-фреймворк.
- `mod/` — встраивание в LBR (объект `o_invoker_arena`, ввод, отрисовка, автотест), `build/` — скрипты UTMT (`.csx`).
- `lib.sh` / `lib.ps1` — общие пути (поиск Steam-библиотеки, сейвов, UTMT).
- `out/` — собранный мод, `backup/data.win.orig` — оригинал, от которого он собран.
- `assets/` — иконки и звуки для мода, `assets_raw/` — то, что вытащено из VPK Доты, `decompiled/` — декомпил LBR (справочно).
- `docs/tdd/` — отчёт TDD, `docs/loop_progress.md` — статус и открытые толкования механик.
