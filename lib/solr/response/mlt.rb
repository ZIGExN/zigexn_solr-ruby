class Solr::Response::Mlt < Solr::Response::Ruby
  def initialize(ruby_code)
    super
    @response = @data['response']
  end

  def hits
    @response['docs']
  end
end
