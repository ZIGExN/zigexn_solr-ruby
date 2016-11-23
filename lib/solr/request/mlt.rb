require 'erb'
class Solr::Request::Mlt < Solr::Request::Base
  def initialize(params)
    @params = params
  end

  def response_format
    :ruby
  end

  def handler
    'mlt'
  end

  def content_type
    'application/x-www-form-urlencoded; charset=utf-8'
  end

  def to_hash
    @params.update(:wt => 'ruby')
  end

  def to_s
    raw_params = self.to_hash

    http_params = []
    raw_params.each do |key,value|
      if value.respond_to?(:each) && !value.is_a?(String)
        value.each { |v| http_params << "#{key}=#{ERB::Util::url_encode(v)}" unless v.nil?}
      else
        http_params << "#{key}=#{ERB::Util::url_encode(value)}" unless value.nil?
      end
    end

    http_params.join("&")
  end
end
