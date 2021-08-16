# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/hexlet_code'

class AppTest < Minitest::Test
  def setup
    @user_struct = Struct.new(:name, :job, :gender, keyword_init: true)
    @user = @user_struct.new(name: 'James', job: 'Metallica', gender: 'm')
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

  def test_form_url
    form_action = '/my-users'
    form = HexletCode.form_for @user, form_action
    assert form.include? "action=\"#{form_action}\""
  end

  def test_no_value_input
    user = @user_struct.new
    form = HexletCode.form_for user do |f|
      f.input :name
      f.input :job, as: :text
    end
    textarea = '<textarea name="job" cols="20" rows="40"></textarea>'
    input = '<input type="text" name="name">'
    assert form.include? input
    assert form.include? textarea
  end

  def test_textarea_params
    user = @user_struct.new
    form = HexletCode.form_for user do |f|
      f.input :job, as: :text, cols: 30, rows: 50
    end
    assert form.include? '<textarea name="job" cols="30" rows="50"></textarea>'
  end
end
