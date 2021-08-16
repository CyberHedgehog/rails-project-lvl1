# frozen_string_literal: true

module HexletCode::Inputs
  class Input
    def initialize(params = {})
      @params = params
    end

    def to_html
      props = { type: @params[:type] || 'text', **@params }
      HexletCode::Tag.build('input', props)
    end

    def label
      HexletCode::Tag.build('label', for: @params[:name]) { @params[:name].capitalize }
    end
  end
end
