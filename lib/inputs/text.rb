# frozen_string_literal: true

module Inputs
  class Text < Input
    def to_html
      HexletCode::Tag.build('textarea', cols: @params[:cols] || 20, rows: @parms[:rows] || 40, name: @params[:name]) { @params[:value] }
    end
  end
end
