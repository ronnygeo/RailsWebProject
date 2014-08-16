class PagesController < ApplicationController
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
