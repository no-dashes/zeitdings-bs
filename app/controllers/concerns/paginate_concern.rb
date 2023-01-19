module PaginateConcern
  extend ActiveSupport::Concern

  class Pager < Struct.new(:page, :pagesize, :pages, :sort, :sort_direction)
  end

  def paginate(klaz)
    page = params[:page].try(:to_i) || 1
    page = 1 if page < 1
    pagesize = params[:pagesize].try(:to_i) || 10
    pages = (klaz.all.count + pagesize - 1) / pagesize
    page = [pages, page].min
    sort = params[:sort]
    sort_direction = params[:sort_direction] || 'asc'
    if sort
      klaz = klaz.reorder(sort => sort_direction)
    end
    @pager = Pager.new(page, pagesize, pages, sort, sort_direction)
    klaz.order(id: :asc).limit(pagesize).offset((page-1) * pagesize)
  end
end
