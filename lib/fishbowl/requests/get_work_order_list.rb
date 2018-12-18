module Fishbowl::Requests
  def self.get_work_order_list
    _, response = Fishbowl::Objects::BaseObject.new.send_request('WorkOrderListRq', 'WorkOrderListRs')

    Hash.from_xml(response.to_s)
  end
end
