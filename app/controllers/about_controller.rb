class AboutController < ApplicationController
  before_action :authorize
  def index;
  @salam="salam"
end

end