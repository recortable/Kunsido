class Admin::VersionsController < ApplicationController
  respond_to :html
  expose(:versions) { Version.all }

  def index

  end
end
