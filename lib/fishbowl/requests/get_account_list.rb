module Fishbowl::Requests
  def self.get_account_list
    _, response = Fishbowl::Objects::BaseObject.new.send_request('GetAccountListRq', 'GetAccountListRs')
    #
    # results = []
    #
    # response.xpath("//Account").each do |account_xml|
    #   results << Account.new(account_xml)
    # end
    #
    # results
    #
    Hash.from_xml(response.to_s)
  end
end
