module Fishbowl::Requests
  def self.get_export_list
    _, response = Fishbowl::Objects::BaseObject.new.send_request('ExportListRq', 'ExportListRs')

    # results = []
    # #response.xpath("//Customer/Name").each do |customer_xml|
    # #  results << customer_xml.inner_text
    # #end
    #
    # results
    XmlSimple.xml_in(response.to_s)
  end
end
