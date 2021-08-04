# frozen_string_literal: true

module HexletCode
  def self.form_for(_entity, url = '#')
    self::Tag.build('form', { action: url, method: 'post' }) { '' }
  end
end
