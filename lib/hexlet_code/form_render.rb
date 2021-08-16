# frozen_string_literal: true

module HexletCode
  class FormRender
    def initialize(form)
      @form = form
    end

    def to_html
      inputs = @form.inputs.each_with_object([]) { |input, result| result.push(input.label, input.to_html) }.join
      HexletCode::Tag.build('form', action: @form.action, method: 'post') { inputs }
    end
  end
end
