# frozen_string_literal: true

module HexletCode
  module Inputs
    class Select < Input
      def to_html
        select_opts = @params[:collection].each_with_object([]) do |option, result|
          tag_opts = { value: option }
          tag_opts[:selected] = nil if option == @params[:value]
          result << HexletCode::Tag.build('option', tag_opts) { option }
        end
        props = @params.reject { |k| %i[value as collection].include? k }
        HexletCode::Tag.build('select', props) { select_opts.join }
      end
    end
  end
end
