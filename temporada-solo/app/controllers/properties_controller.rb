class PropertiesController < ApplicationController
  def new
    @property = Property.new
    @property_types = PropertyType.all
  end
end
