class ShouyeController < ApplicationController
	def index

	end

	def content
		id = params[:id]
		@content = Content.find(id)
		markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink:true, tables:true)
		@res = markdown.render(@content.content)
	end
end
