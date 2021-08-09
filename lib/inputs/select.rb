# frozen_string_literal: true

module Inputs
  class Select < Input
    def to_html
      select_opts = @params.dig(:options, :collection).each_with_object([]) do |option, result|
        tag_opts = { value: option }
        tag_opts[:selected] = nil if option == @params[:value]
        result << HexletCode::Tag.build('option', tag_opts) { @params[:value] }
      end
      HexletCode::Tag.build('select', name: @params[:name]) { select_opts.join }
    end
  end
end
