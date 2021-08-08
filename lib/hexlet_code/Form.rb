module HexletCode
  class Form
    def initialize(entity, action)
      @entity = entity
      @action = action
      @inputs = []
    end

    def input(name, params = {})
      value = @entity[name]
      type = params[:as]
      if type.nil?
        @inputs << HexletCode::Tag.build('input', type: 'text', value: value, name: name)
      end
      if type == :text
        @inputs << HexletCode::Tag.build('textarea', cols: 20, rows: 40, name: name) { value }
      end
      if type == :select
        options_tags = params[:collection].each_with_object([]) do |option, options|
          props = { value: option }
          if value == option
            props[:selected] = nil
          end
          options << HexletCode::Tag.build('option', props)
        end
      end
    end

    def to_html
      inputs = @inputs.join
      puts @inputs
      HexletCode::Tag.build('form', action: @action) { inputs }
    end
  end
  
end