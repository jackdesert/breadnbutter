require "breadnbutter/version"

if Rails.version < '3.1'
  raise "Rails 3.1 or greater is required to run BreadnButter"
end

require 'breadnbutter/railtie' 
require 'breadnbutter/engine'

module BreadnButter
  class Crumb
    JOINER = "&raquo;".html_safe
    HIDDEN_ELEMENTS = []
    HOME_URL = '/'
    HOME_TEXT = 'HOME'

    attr_accessor :url, :text

    def linkable
      url.present?
    end

    def hidden?
      hidden_elements.include? text
    end

    def joiner
      begin
        Rails.configuration.breadnbutter_joiner
      rescue NoMethodError
        JOINER
      end
    end

    def hidden_elements
      begin
        Rails.configuration.breadnbutter_hidden_elements
      rescue NoMethodError
        HIDDEN_ELEMENTS
      end
    end

    def self.home_text
      begin
        Rails.configuration.breadnbutter_home_text
      rescue NoMethodError
        HOME_TEXT
      end
    end

    def self.home_url
      begin
        Rails.configuration.breadnbutter_home_url
      rescue NoMethodError
        HOME_URL
      end
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
      first = self.new_from_hash(text: home_text, url: home_url)
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

