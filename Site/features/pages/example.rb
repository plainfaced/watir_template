module Example

  def search_box
    @browser.input(id: 'search')
  end

  def title_act
    @browser.h5(id: 'act')
  end

end