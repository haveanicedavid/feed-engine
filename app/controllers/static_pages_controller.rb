class StaticPagesController < ApplicationController
  skip_before_action :check_email
end
