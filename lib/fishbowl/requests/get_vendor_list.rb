module Fishbowl::Requests
  def self.get_vendor_list
    rq = 'VendorListRq'
    rs = 'VendorListRs'
    _, response = Fishbowl::Objects::BaseObject.new.send_request(rq, rs)

    # results = []
    # response.xpath("//Vendor").each do |vendor_xml|
    #   results << Fishbowl::Objects::Vendor.new(vendor_xml)
    # end
    #
    # results
    Hash.from_xml(response.to_s)["FbiMsgsRs"][0][rs]
  end
end
