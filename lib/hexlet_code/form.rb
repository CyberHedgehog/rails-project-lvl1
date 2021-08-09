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
      @inputs << Object.const_get("Inputs::#{type.to_s.capitalize}").new(name: name, value: value, **params)
    end

    def submit(value = 'Save')
      @inputs << Inputs::Input.new(type: 'submit', value: value, name: 'commit')
    end

    def to_html
      # inputs = @inputs.map(&:to_html).join
      puts @inputs
      inputs = @inputs.each_with_object([]) { |input, result| result.push(input.label, input.to_html) }.join
      HexletCode::Tag.build('form', action: @action) { inputs }
    end
  end
end
