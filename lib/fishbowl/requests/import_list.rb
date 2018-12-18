module Fishbowl::Requests
  def self.import_list(options = {})
    options = options.symbolize_keys

    request = build_request(options)
    Fishbowl::Objects::BaseObject.new.send_request(request.doc.root.to_xml, 'ImportRs')
  end

  private

  def self.build_request(options)
    rows = Nokogiri::XML::Builder.new do |xml|
      xml.Rows {
        options[:rows].each do |l|
          xml.Row l
        end
      }
    end
    Nokogiri::XML::Builder.new do |xml|
      xml.ImportRq {
        xml.Type options[:type]
        xml << rows.doc.root.to_xml
      }
    end
  end

end
