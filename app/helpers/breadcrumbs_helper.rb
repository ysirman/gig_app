module BreadcrumbsHelper
  def add_breadcrumb(name, path)
    unless @_breadcrumbs
      @_breadcrumbs = [OpenStruct.new(name: "HOME", path: root_path)]
    end

    if @_breadcrumbs
      @_breadcrumbs << OpenStruct.new(name: name, path: path)
    end
  end

  def breadcrumbs
    @_breadcrumbs
  end
end