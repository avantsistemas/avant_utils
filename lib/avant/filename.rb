# frozen_string_literal: true

module Avant
  class Filename
    def self.normalize(*names)
      names.map { |name| name.parameterize(separator: '_', preserve_case: true) }.join('_')
    end

    def self.timestamp(*names)
      timestamp = Time.current.strftime('%Y-%m-%d_%Hh%Mm%Ss')
      "#{timestamp}_#{normalize(*names)}"
    end
  end
end
