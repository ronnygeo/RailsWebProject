class PagesController < ApplicationController
  layout "home-layout", only: :home
  def home

  end

  def contact
  end

  def about
  end

  def phone_verified?(user)
      user.phone_verified
  end
end
