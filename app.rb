require 'tempfile'
require 'imgkit'
require 'chunky_png'

class Table2PNG < Sinatra::Base
  configure do
    IMGKit.configure do |config|
      config.wkhtmltoimage = File.join(File.dirname(__FILE__), 'wkhtmltoimage')
      config.default_options = { quality: 100, "disable-javascript" => true }
    end
  end

  get '/' do
    %(
      <form method="POST">
        <textarea name="table" style="width:50%; height: 300px;"></textarea>
        <input type="submit" />
      </form>
    )
  end

  post '/' do
    headers({
      'Content-Disposition' => 'inline',
      'Content-Type' => 'image/png'
    })

    Converter.new(params[:table]).process
  end

  class Converter
    def initialize html
      @html = html
    end

    def process
      image_from_table = IMGKit.new(@html)
      image_from_table.stylesheets << "table.css"

      png = ChunkyPNG::Image.from_blob(image_from_table.to_img(:png))
      png.trim!

      png.to_blob
    end
  end

end
