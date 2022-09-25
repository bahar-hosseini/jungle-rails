# frozen_string_literal: true

module Admin
  class DashboardController < ApplicationController
    def show
      @product_count = Product.count
      @categories_count = Category.count
      puts Category.all
    end
  end
end
