# frozen_string_literal: true

require 'hexlet_code/version'
require 'hexlet_code/tag'
require 'hexlet_code/inputs/base_input'
require 'hexlet_code/inputs/input'
require 'hexlet_code/inputs/text'
require 'hexlet_code/inputs/select'
require 'hexlet_code/form'
require 'hexlet_code/form_render'

module HexletCode
  class Error < StandardError; end

  def self.form_for(entity, url = '#')
    form = Form.new(entity, url)
    yield form if block_given?
    form_render = FormRender.new(form)
    form_render.to_html
  end
end
