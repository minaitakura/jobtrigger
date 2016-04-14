class JobsController < ApplicationController
  before_action :logged_in_user , except: [:show]
  before_action :set_job, only: [:show]

  def new
    
    if params[:q]
      url = 'http://tenshoku.mynavi.jp/list/o1A/'
      #url='http://qiita.com/akkun_choi/items/a1fbde5d6d065df3fc97'
      page = URI.parse(url).read
      #charset = page.charset
     
      #if charset == "iso-8859-1"
      #  charset = page.scan(/charset="?([^\s"]*)/i).first.join
      #end
      charset="nil"
      html = open(url) do |f|
      
        charset = f.charset
        f.read # htmlを読み込んで変数htmlに渡す
      end
      p charset
      # htmlをパース(解析)してオブジェクトを作成
      doc = Nokogiri::HTML.parse(html, nil, "CP932")
      p "@@てすと@@@"
      p doc.title
      doc.xpath('//div[@class="result "]').each do |node|
        p "step in"
    
        if node.css('h1').inner_text.include?(params[:q])
          @jobs = Job.find_or_initialize_by(company: node.css('h2').inner_text)
        end

        p node.css('h2').inner_text
              p "@@@@@"

      end

    end
  end

  def show
  end

  private
  def set_job
    @job = Job.find(params[:id])
  end

end

