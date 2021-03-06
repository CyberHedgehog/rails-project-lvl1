# frozen_string_literal: true

module HexletCode
  module Inputs
    class Text < BaseInput
      def to_html
        props = @params.reject { |k| %i[as value].include? k }
        props[:cols] = 20 unless props.key? :cols
        props[:rows] = 40 unless props.key? :rows
        HexletCode::Tag.build('textarea', props) do
          @params[:value]
        end
      end
    end
  end
end
