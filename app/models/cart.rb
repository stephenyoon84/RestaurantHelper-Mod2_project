class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :menu

  def self.order_counter
    @new = {}
    self.all.each do |cart|
      if @new[cart.menu.name].nil?
        @new[cart.menu.name] = 1
      else
        @new[cart.menu.name] += 1
      end
    end
    @new.sort_by{|k, v| v}.reverse
  end
end
