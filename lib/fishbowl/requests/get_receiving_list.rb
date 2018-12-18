module Fishbowl::Requests
  def self.get_receiving_list
    rq = 'ReceivingListRq'
    rs = 'ReceivingListRs'
    builder = Nokogiri::XML::Builder.new do |xml|
      xml.request {
        xml.ReceivingListRq {
          xml.OrderNumber "1976"
          xml.PartNum "R&D General Material"
        }
      }
    end
    _, response = Fishbowl::Objects::BaseObject.new.send_request(builder, rs)

    # results = []
    # response.xpath("//Vendor").each do |vendor_xml|
    #   results << Fishbowl::Objects::Vendor.new(vendor_xml)
    # end
    #
    # results
    Hash.from_xml(response.to_s)['FbiXml']['FbiMsgsRs'][rs]
  end
end
