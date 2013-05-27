require "breadnbutter/version"
require 'active_support/core_ext/string' # This allows us to require this file outside of Rails
require 'breadnbutter/railtie' if defined?(Rails::Railtie)
require 'pry'
#binding.pry

module BreadnButter
  class Crumb
    JOINER = " &raquo; ".html_safe
    HIDDEN_TEXT_ELEMENTS = ['Permanent Pages']
    FIRST_OVERRIDE_URL = '/'
    FIRST_OVERRIDE_TEXT = 'HOME'

    attr_accessor :url, :text

    def linkable
      url.present?
    end

    def joiner
      JOINER
    end

    def hidden?
      HIDDEN_TEXT_ELEMENTS.include? text
    end

    def self.new_from_hash(hash)
      new_crumb = self.new
      new_crumb.text = value_from_key(:text, hash)
      new_crumb.url = value_from_key(:url, hash)
      new_crumb
    end

    def self.get_text_from_element(element, previous_element)
      if element =~ /^[0-9]+$/      
        model = previous_element.classify.constantize
        begin
          text = model.find(element).name
        rescue NoMethodError
          text = element
        end
      else
        text = element
      end
      text.titleize
    end

    def self.override_first(array)
      first = self.new_from_hash(text: FIRST_OVERRIDE_TEXT, url: FIRST_OVERRIDE_URL)
      array[0] = first
      array
    end

    def self.generate_crumbs_from_url(in_url)
      output = []
      used_elements = []
      elements = in_url.split('/')
      last_index = elements.length - 1
      elements.each_with_index do |element, index|
        used_elements << element
        url = used_elements.join('/')
        previous_element = elements[index -1]
        text = self.get_text_from_element(element, previous_element)
        output_url = (index < last_index) ? url : nil
        new_crumb = self.new_from_hash(url: output_url, text: text)
        output << new_crumb unless new_crumb.hidden?
      end
      self.override_first(output)
    end


    protected

    def self.value_from_key(key, hash)
      hash[key.to_s] || hash[key.to_sym]
    end
  end

end

require 'breadnbutter/engine'
