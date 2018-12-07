module Fishbowl::Requests
  def self.get_product(product_number)
    raise ArgumentError if product_number.nil?
    rs = "ProductGetRs"
    builder = Nokogiri::XML::Builder.new do |xml|
      xml.request {
        xml.ProductGetRq {
          xml.Number product_number
          xml.GetImage false
        }
      }
    end

    code, response = Fishbowl::Objects::BaseObject.new.send_request(builder, rs)

    # response.xpath("//FbiXml/FbiMsgsRs/ProductGetRs/Product")
    XmlSimple.xml_in(response.to_s)["FbiMsgsRs"][0][rs]
  end
end
