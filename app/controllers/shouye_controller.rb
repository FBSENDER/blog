class ShouyeController < ApplicationController
  before_action :autherize, only: [:write]
  # http_basic_authenticate_with name: "humbaba", password: "5baa61e4"
  force_ssl 

  def index
    redirect_to protocol: 'https://'
    typeid = params[:typeid]

    if typeid
      @content = Content.where("type_id = ?", typeid.to_i)
    else
      @content = Content.order("updated_at DESC")
    end
  end

  def content
    id = params[:id]
    @content = Content.find(id)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink:true, tables:true)
    @res = markdown.render(@content.content)
  end

  def write

  end

  def submit
    title = params[:title]
    typeid = params[:type]
    jianjie = params[:jianjie]
    content = params[:content]
    keywords = params[:keyword]
    res = Content.create({title: title, user_id: 1, content: content, short_content: jianjie, read_count: 0, praise_count: 0, type_id: typeid, keywords: keywords, description: ''})
    render json: {:success=>true}.to_json
  end

  def login

  end

  def logout
    session[:username] = nil
    redirect_to "/"
  end

  def login_auth
    username = params[:username]
    password = params[:password]
    row = User.where("name = ? and password = ?", username, password).first
    if row
      session[:username] = username
      render json: {:success => true}.to_json
    else
      render json: {:success => false}.to_json
    end
  end
end
