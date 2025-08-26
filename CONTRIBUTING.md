# Contributing to VergissBerlin CLI

Vielen Dank für dein Interesse am VergissBerlin CLI Projekt! Hier findest du Informationen, wie du zum Projekt beitragen und lokale Releases erstellen kannst.

## Entwicklungsumgebung einrichten

### Voraussetzungen
- Ruby (Version 3.2 oder höher)
- Bundler
- Git

### Installation
```bash
# Repository klonen
git clone https://github.com/vergissberlin/vergissberlin-cli.git
cd vergissberlin-cli

# Dependencies installieren
bundle install
```

## Tests ausführen

```bash
# Alle Tests ausführen
bundle exec rake test

# Tests mit Coverage ausführen
bundle exec rake coveralls:push
```

## Lokales Release erstellen

### 1. Version aktualisieren

Bearbeite die Datei `lib/vergissberlin/version.rb` und aktualisiere die Versionsnummer:

```ruby
module Vergissberlin
  VERSION = "1.0.0"  # Neue Versionsnummer hier eintragen
end
```

### 2. Änderungen committen

```bash
# Änderungen stagen und committen
git add .
git commit -m "Bump version to 1.0.0"
```

### 3. Tag erstellen

```bash
# Git Tag erstellen
git tag v1.0.0

# Tag pushen
git push origin v1.0.0
```

### 4. Gem lokal bauen und testen

```bash
# Gem bauen
gem build vergissberlin.gemspec

# Gem lokal installieren und testen
gem install vergissberlin-1.0.0.gem

# Testen ob das CLI funktioniert
vergissberlin --help
```

### 5. GitHub Release erstellen

1. Gehe zu [GitHub Releases](https://github.com/vergissberlin/vergissberlin-cli/releases)
2. Klicke auf "Create a new release"
3. Wähle den erstellten Tag (z.B. `v1.0.0`)
4. Füge Release Notes hinzu
5. Klicke auf "Publish release"

Die GitHub Action wird automatisch das Gem zu RubyGems veröffentlichen.

## Release zu RubyGems veröffentlichen (manuell)

Falls du das Gem manuell veröffentlichen möchtest:

```bash
# Gem bauen
gem build vergissberlin.gemspec

# Zu RubyGems veröffentlichen
gem push vergissberlin-1.0.0.gem
```

**Hinweis**: Du benötigst einen RubyGems Account und API Key für die manuelle Veröffentlichung.

## Beitragsrichtlinien

### Code Style
- Verwende 2 Spaces für Einrückung
- Schreibe aussagekräftige Commit Messages
- Füge Tests für neue Features hinzu

### Pull Request Prozess
1. Fork das Repository
2. Erstelle einen Feature Branch (`git checkout -b feature/amazing-feature`)
3. Committe deine Änderungen (`git commit -m 'Add amazing feature'`)
4. Pushe zum Branch (`git push origin feature/amazing-feature`)
5. Erstelle einen Pull Request

### Issue Reporting
- Verwende die Issue Templates
- Beschreibe das Problem klar und vollständig
- Füge Schritte zur Reproduktion hinzu

## Versionierung

Wir folgen [Semantic Versioning](https://semver.org/):
- **MAJOR** Version für inkompatible API-Änderungen
- **MINOR** Version für neue Features (rückwärtskompatibel)
- **PATCH** Version für Bugfixes (rückwärtskompatibel)

## Lizenz

Durch das Beitragen zu diesem Projekt stimmst du zu, dass deine Beiträge unter der MIT-Lizenz lizenziert werden.
