class Admin::VersionsController < ApplicationController
  respond_to :html
  expose(:versions) { Version.order('id DESC').all }

  def index

  end
end
