# frozen_string_literal: true
require_relative('Form')

module HexletCode
  def self.form_for(_entity, url = '#')
    form = Form.new(_entity, url)
    if block_given?
      yield form
    end
    form.to_html
  end
end
