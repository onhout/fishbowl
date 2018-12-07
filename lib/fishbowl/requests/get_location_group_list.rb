module Fishbowl::Requests
  def self.get_location_group_list
    _, response = Fishbowl::Objects::BaseObject.new.send_request('LocationGroupRq', 'LocationGroupRs')

    # results = []
    # #response.xpath("//Customer/Name").each do |customer_xml|
    # #  results << customer_xml.inner_text
    # #end
    #
    # results
    data = XmlSimple.xml_in(response.to_s)
    data['FbiMsgsRs']['VendorNameListRs']
  end
end
