# frozen_string_literal: true

class Admin::ProductsController < AdminController
  def index
    @active_item = :products
  end
end
