# frozen_string_literal: true

module Admin
  class CategoriesController < ApplicationController
    http_basic_authenticate_with name: ENV['USER_NAME'], password: ENV['PASSWORD']

    def index
      @categories = Category.order(id: :desc).all
    end

    def new
      @category = Category.new
    end

    def create
      @category = Category.new(category_params)

      if @category.save
        redirect_to %i[admin categories], notice: 'Category created!'
      else
        render :new
      end
    end

    private

    def category_params
      params.require(:category).permit(
        :name
      )
    end
  end
end
