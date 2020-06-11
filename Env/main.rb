require 'watir'
require 'cucumber'
require 'securerandom'
require 'active_record'
require 'httparty'
require 'date'
require 'json'
require 'sanitize'

require_relative '../Env/database'

require_relative '../../Watir/Site/features/pages/example'

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
                Watir::Browser.new :chrome #, headless: true
              end

    @browser = browser

    case ENV['DEVICE']
    when 'desktop'
      @browser.window.resize_to(1920, 1080)
    when 'tablet'
      @browser.window.resize_to(768, 1024)
    when 'mobile'
      @browser.window.resize_to(412, 847)
    else
      @browser.window.resize_to(1920, 1080)
    end
  end

  def mobile_resize
    @browser.window.resize_to(375, 812)
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

  ##### HTTPARTY

  def httparty_example
    data = HTTParty.get('https://api.openweathermap.org/data/2.5/weather?q=Coburg,Victoria,AU&appid=#{api_key}')
  end

end
