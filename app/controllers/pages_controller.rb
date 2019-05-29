class PagesController < ApplicationController
	layout 'about', only: [:about]

  def home
  end

  def about
  end
end