class PagesController < ApplicationController

  def index
    @title = 'Section 508'
  end

  def formatting
    @title = 'Section 508 - Formatting'
  end

  def tables
    @title = 'Section 508 - Tables'
  end

  def images
    @title = 'Section 508 - Images'
  end

  def media
    @title = 'Section 508 - Media'
  end

end
