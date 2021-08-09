module Inputs
  class Input
    def initialize(params = {})
      @params = params
    end

    def to_html
      HexletCode::Tag.build('input', type: 'text', value: @params[:value], name: @params[:name])
    end
  end
end