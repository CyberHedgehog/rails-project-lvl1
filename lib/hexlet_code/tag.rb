# frozen_string_literal: true

module HexletCode
  module Tag
    def self.build(name, params = {})
      params_string = params.each_with_object('') { |(key, value), str| str << " #{key}=\"#{value}\"" }
      tag = "<#{name}#{params_string}>"
      if block_given?
        body = yield
        tag << "#{body}</#{name}>"
      end
      tag
    end
  end
end
