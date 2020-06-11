# ---------------------
# The customers module includes items that fall under the customers tab in alfred
# related methods
# ---------------------

require 'watir'
require 'cucumber'
require 'securerandom'

module Example

  def search_box
    @browser.input(id: 'search')
  end

  #When iterating through many div, span, h5 etc.. use plural
  def title_act
    @browser.h5(id: 'act')
  end

end