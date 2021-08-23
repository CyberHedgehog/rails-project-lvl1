# frozen_string_literal: true

module HexletCode
  module Inputs
    class Input < BaseInput
      def to_html
        props = { type: @params[:type] || 'text', **@params }
        HexletCode::Tag.build('input', props)
      end
    end
  end
end
