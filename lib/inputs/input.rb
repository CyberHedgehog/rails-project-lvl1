# frozen_string_literal: true

module Inputs
  class Input
    def initialize(params = {})
      @params = params
    end

    def to_html
      HexletCode::Tag.build('input', type: @params[:type] || 'text', value: @params[:value], name: @params[:name])
    end

    def label
      HexletCode::Tag.build('label', for: @params[:name]) { @params[:name].capitalize }
    end
  end
end
