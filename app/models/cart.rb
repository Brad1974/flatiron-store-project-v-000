class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def add_item(item_id)
    line_item = self.line_items.find_by(item_id: item_id)
    if line_item
      line_item.quantity += 1
    else
      line_item=self.line_items.build(item_id: item_id)
    end
    line_item
  end

  def total
    totalprice = 0
    self.line_items.each do |li|
      totalprice += (li.quantity * li.item.price)
    end
    totalprice
  end
end
