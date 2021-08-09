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
      @inputs << Object.const_get("Inputs::#{type.to_s.capitalize}").new(name: name, value: value)
    end

    def to_html
      inputs = @inputs.map { |i| i.to_html }.join
      puts @inputs
      HexletCode::Tag.build('form', action: @action) { inputs }
    end
  end
  
end