# frozen_string_literal: true

module Vergissberlin
  # Randomly picked reasons for wanting to forget Berlin.
  # The reasons stay German on purpose - the gem name is a German joke.
  module Reasons
    HEADLINE = 'Ein Grund, Berlin zu vergessen:'

    ALL = [
      'Ein gebrochenes Herz, das noch am Kottbusser Tor wartet.',
      'In der U8 riecht es nach warmem Bier und alten Fehlern.',
      'Die Straßen kleben, und niemand weiß genau, wovon.',
      'Die Stadt kommt nie zur Ruhe, nicht mal dienstags um vier.',
      'Zwei Jahre Wohnungssuche, null Besichtigungstermine.',
      'Der Späti hat zu, genau dann, wenn du ihn brauchst.',
      'Baustellen, die älter sind als deine letzte Beziehung.',
      'Die S-Bahn fällt aus. Grund: Es ist Mittwoch.',
      'Zwei Stunden Schlange, dann ein Kopfschütteln an der Tür.',
      'Der Sommer dauerte elf Tage, dann kam wieder Novembergrau.',
      'Der Amtstermin ist frei - im übernächsten Frühling.',
      'Das Fahrrad war neu. Genau eine Nacht lang.',
      'Alle wollen sich melden. Niemand meldet sich.',
      'Die Miete wächst schneller als der Fernsehturm hoch ist.',
      'Im Treppenhaus riecht es nach Silvester. Es ist Juli.',
      'Am Ende bleibt Techno im Ohr und Sand in den Schuhen.'
    ].freeze

    # Pass a seeded Random for reproducible output.
    def self.sample(random: Random.new)
      ALL.sample(random: random)
    end
  end
end
