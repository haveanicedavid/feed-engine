class StaticPagesController < ApplicationController
  skip_before_action :require_email
end
