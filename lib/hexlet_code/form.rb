# frozen_string_literal: true

module HexletCode
  class Form
    def initialize(entity, action)
      @entity = entity
      @action = action
      @inputs = []
    end

    def input(name, params = {})
      value = @entity[name]
      type = params[:as] || :input
      @inputs << Object.const_get("Inputs::#{type.to_s.capitalize}").new(name: name, value: value, options: params)
    end

    def to_html
      inputs = @inputs.map(&:to_html).join
      HexletCode::Tag.build('form', action: @action) { inputs }
    end
  end
end
