class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  layout 'pages'
  def home
  end
end
