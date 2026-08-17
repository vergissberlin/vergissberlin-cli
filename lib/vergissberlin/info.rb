# frozen_string_literal: true

module Vergissberlin
  # Info about the author, rendered as a small unicode table.
  module Info
    BOLD = "\e[1m"
    CYAN = "\e[36m"
    RESET = "\e[0m"

    ROWS = [
      ['Name', 'André Lademann'],
      ['Rolle', 'Cloud Consultant'],
      ['Firma', 'Thinkport'],
      ['Standort', 'Leipzig, Germany'],
      ['Skills', 'Kubernetes, Terraform, Home Assistant, LoRaWAN, Ruby'],
      ['GitHub', 'https://github.com/vergissberlin'],
      ['Blog', 'https://blog.andrelademann.de']
    ].freeze

    # Rows whose value gets highlighted as a link when colorized.
    LINK_LABELS = %w[GitHub Blog].freeze

    LABEL_WIDTH = ROWS.map { |label, _| label.length }.max
    VALUE_WIDTH = ROWS.map { |_, value| value.length }.max

    def self.render(colorize: false)
      lines = [top_border]
      ROWS.each { |row| lines << row_line(row, colorize) }
      lines << bottom_border
      "#{lines.join("\n")}\n"
    end

    def self.top_border
      "┌#{'─' * (LABEL_WIDTH + 2)}┬#{'─' * (VALUE_WIDTH + 2)}┐"
    end

    def self.bottom_border
      "└#{'─' * (LABEL_WIDTH + 2)}┴#{'─' * (VALUE_WIDTH + 2)}┘"
    end

    def self.row_line(row, colorize)
      label, value = row
      padded_label = label.rjust(LABEL_WIDTH)
      padded_value = value.ljust(VALUE_WIDTH)

      if colorize
        padded_label = "#{BOLD}#{padded_label}#{RESET}"
        padded_value = "#{CYAN}#{padded_value}#{RESET}" if LINK_LABELS.include?(label)
      end

      "│ #{padded_label} │ #{padded_value} │"
    end

    private_class_method :top_border, :bottom_border, :row_line
  end
end
