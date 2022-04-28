# frozen_string_literal: true

module AvantUtils
  module Axlsx
    module Formulas
      def self.sum(header_row:, last_row:, header_cell_value:)
        header_cell = header_row.find { |cell| cell.value == header_cell_value }
        column_index = header_cell.index

        first_cell_reference = ::Axlsx.cell_r column_index, header_row.row_index + 1
        last_cell_reference = last_row[column_index].r

        "=SUM(#{first_cell_reference}:#{last_cell_reference})"
      end
    end
  end
end
