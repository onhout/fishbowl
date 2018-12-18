module Fishbowl::Requests
  def self.get_account_balance(account_name)
    builder = Nokogiri::XML::Builder.new do |xml|
      xml.request {
        xml.GetAccountBalanceRq {
          xml.Account (account_name)
        }
      }
    end
    _, response = Fishbowl::Objects::BaseObject.new.send_request(builder.to_xml, "GetAccountBalanceRs")

    # response.xpath("//Account/Balance").first.inner_text
    Hash.from_xml(response.to_s)
  end
end
