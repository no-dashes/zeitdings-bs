class CrudConcern < Module

  METHODS = %i[index edit show new]

  attr_reader :use_paginate

  def initialize(meths = nil, use_paginate: true)
    @methods = meths || METHODS
    @use_paginate = use_paginate
  end

  module Index
    def index
      klaz_name = self.class.name.split("Controller").first.singularize
      klaz = klaz_name.constantize
      instance_variable_name = klaz_name.tableize
      if self.class.class_variable_get("@@crud").use_paginate # respond_to?(:paginate)
        instance_variable_set("@#{instance_variable_name}", paginate(klaz))
      else
        instance_variable_set("@#{instance_variable_name}", klaz.all)
      end
    end
  end



  def included(by)
    by.class_variable_set "@@crud", self
    by.include Index if @methods.member?(:index)
    # by.include Edit
    # by.include Update
  end

end
