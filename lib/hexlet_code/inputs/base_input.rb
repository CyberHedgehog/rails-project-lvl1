# frozen_string_literal: true

module HexletCode
  module Inputs
    class BaseInput
      def initialize(params = {})
        @params = params
      end

      def label
        HexletCode::Tag.build('label', for: @params[:name]) { @params[:name].capitalize }
      end
    end
  end
end
