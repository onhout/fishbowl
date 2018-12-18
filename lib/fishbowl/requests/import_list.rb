module Fishbowl::Requests
  def self.import_list(options = {})
    options = options.symbolize_keys

    request = build_request(options)
    Fishbowl::Objects::BaseObject.new.send_request(request.doc.root.to_xml, 'ImportRs')
  end

  private

  def self.build_request(options)

    Nokogiri::XML::Builder.new do |xml|
      xml.ImportRq {
        xml.Type options[:type]
        xml.Rows {
          xml.Row options[:rows]
        }
      }
    end
  end

end
