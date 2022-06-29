# frozen_string_literal: true

module Avant
  module Axlsx
    class Styles
      def initialize(workbook)
        @workbook = workbook
      end

      def title
        @title ||= @workbook.styles.add_style b: true, sz: 16
      end

      def subtitle
        @subtitle ||= @workbook.styles.add_style sz: 14
      end

      def table_header
        @table_header ||= @workbook.styles.add_style b: true, bg_color: 'ffc107', border: { style: :thin, color: '00',
                                                                                            edges: %i[bottom] }
      end

      def table_footer
        @table_footer ||= @workbook.styles.add_style b: true, bg_color: 'fff6bf'
      end

      def table_footer_currency
        @table_footer_currency ||= @workbook.styles.add_style b: true, bg_color: 'fff6bf', num_fmt: 8
      end

      def bold
        @bold ||= @workbook.styles.add_style b: true
      end

      def currency
        @currency ||= @workbook.styles.add_style num_fmt: 8
      end

      def datetime
        @datetime ||= @workbook.styles.add_style num_fmt: 22
      end

      def percent
        @percent ||= @workbook.styles.add_style num_fmt: ::Axlsx::NUM_FMT_PERCENT
      end
    end
  end
end
