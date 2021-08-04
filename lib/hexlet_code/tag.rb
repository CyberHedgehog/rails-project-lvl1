# frozen_string_literal: true

module HexletCode
  module Tag
    def self.build(name, params = {})
      params_string = params
        .each_with_object([]) { |(key, value), list| list << " #{key}=\"#{value}\"" }
        .join('')
      tag = "<#{name}#{params_string}>"
      (block_given?) ? "#{tag}#{yield}</#{name}>" : tag
    end
  end
end
