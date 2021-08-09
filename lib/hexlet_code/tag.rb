# frozen_string_literal: true

module HexletCode
  module Tag
    def self.build(name, params = {})
      params_string = params.each_with_object([]) do |(key, value), list|
        list << if value.nil?
                  " #{key}"
                else
                  " #{key}=\"#{value}\""
                end
      end
                            .join
      tag = "<#{name}#{params_string}>"
      block_given? ? "#{tag}#{yield}</#{name}>" : tag
    end
  end
end
