# frozen_string_literal: true

require_relative('form')

module HexletCode
  def self.form_for(entity, url = '#')
    form = Form.new(entity, url)
    yield form if block_given?
    form.to_html
  end
end
