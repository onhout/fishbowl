module Fishbowl::Requests
  def self.get_carrier_list
    rq = 'CarrierListRq'
    rs = 'CarrierListRs'
    _, response = Fishbowl::Objects::BaseObject.new.send_request(rq, rs)

    # results = []
    #
    # response.xpath("//Carriers/Name").each do |carrier_xml|
    #   results << Fishbowl::Objects::Carrier.new(carrier_xml)
    # end
    #
    # results
    # data = XmlSimple.xml_in(response.to_s)["FbiMsgsRs"]
    # puts data["statusCode"]

    XmlSimple.xml_in(response.to_s)["FbiMsgsRs"][0][rs]
  end
end
