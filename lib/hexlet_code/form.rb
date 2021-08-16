# frozen_string_literal: true

module HexletCode
  class Form
    def initialize(entity, action)
      @entity = entity
      @action = action
      @inputs = []
    end

    def input(name, params = {})
      input_params = { name: name, **params }
      input_params[:value] = @entity[name] if @entity[name]
      type = params[:as] || :input
      @inputs << Object.const_get("Inputs::#{type.to_s.capitalize}").new(input_params)
    end

    def submit(value = 'Save')
      @inputs << Inputs::Input.new(type: 'submit', value: value, name: 'commit')
    end

    def to_html
      inputs = @inputs.each_with_object([]) { |input, result| result.push(input.label, input.to_html) }.join
      HexletCode::Tag.build('form', action: @action, method: 'post') { inputs }
    end
  end
end
