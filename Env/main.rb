require 'watir'
require 'cucumber'
require 'securerandom'
require 'active_record'
require 'httparty'
require 'date'
require 'json'
require 'sanitize'

require_relative '../Env/database'

require_relative '../../watir_template/Site/features/pages/example'

class Main
  include Example


  def initialize
    @url = case ENV['URL']
           when 'dev'
             'https://www.theconcertarchive.com/'
           when 'uat'
             'https://www.theconcertarchive.com/'
           end

    Watir.default_timeout = 30
    browser = case ENV['BROWSER']
              when 'ff'
                Watir::Browser.new :firefox
              when 'chrome'
                Watir::Browser.new :chrome
              when 'edge'
                Watir::Browser.new :edge
              when 'ie'
                Watir::Browser.new :ie
              else
                Watir::Browser.new :chrome, headless: true
              end

    @browser = browser
  end

  # ---------------------
  # Common
  # ---------------------

  def enter
    @browser.send_keys :enter
  end

  def tab
    @browser.send_keys :tab
  end

  def space
    @browser.send_keys :space
  end

  def back
    @browser.back
  end

  def sendkeys(*arg)
    @browser.send_keys(*arg)
  end

  def include(*arg)
    @browser.text.include?(*arg)
  end

  def go(*arg)
    @browser.goto(*arg)
  end

  def url
    @browser.url
  end

  def switch
    @browser.windows.last.use
  end

  def screenshot
    @browser.screenshot.save 'screenshot.png'
  end

  def browser_text
    @browser.text
  end

  def close
    @browser.quit
  end

end
