class PagesController < ApplicationController
  layout "home-layout", only: :home

  def home
    @category = Category.all
    @subcats = Subcategory.all

  end

  def contact
  end

  def about
  end

  def package

  end

  def share

  end

  def phone_verified?(user)
      user.phone_verified
  end
end
