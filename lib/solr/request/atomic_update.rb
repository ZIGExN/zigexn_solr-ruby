class Solr::Request::AtomicUpdate < Solr::Request::Update
  # Example: Solr::Request::AtomicUpdate.new([:id => 10, :set => {:field_name => "new value"}])
  def initialize(update_docs)
    @docs = []
    update_docs.each do |update_doc|
      doc = {}
      [:set, :add, :remove, :removeregex, :inc].each do |mode|
        field_data = update_doc[mode]
        if field_data
          field_data.each do |field_name, field_value|
            doc[field_name] = {mode => field_value} if field_value
          end
          update_doc.delete mode
        end
      end
      doc[update_doc.keys[0].to_s] = update_doc.values[0]
      @docs << doc
    end
  end

  def content_type
    'application/json; charset=utf-8'
  end

  # returns the request as a string suitable for posting
  def to_s
    return @docs.to_json
  end
end
