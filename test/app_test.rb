# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/hexlet_code'

class AppTest < Minitest::Test
  def setup
    user = Struct.new(:name, :job, :gender, keyword_init: true)
    @user = user.new(name: 'James', job: 'Metallica', gender: 'm')
  end

  def test_should_work
    file = File.open('test/fixtures/form.html')
    test_form_data = file.read.gsub(/\n/, '').gsub('  ', '')
    file.close
    form = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job, as: :text
      f.input :gender, as: :select, collection: %w[m f]
    end
    assert_equal test_form_data, form
  end
end
