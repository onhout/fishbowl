module Fishbowl::Requests
  def self.get_import_list
    _, response = Fishbowl::Objects::BaseObject.new.send_request('ImportListRq', 'ImportListRs')
    #
    # results = []
    # #response.xpath("//Customer/Name").each do |customer_xml|
    # #  results << customer_xml.inner_text
    # #end
    #
    # results
    Hash.from_xml(response.to_s)['FbiXml']['FbiMsgsRs']['ImportListRs']
  end
end
