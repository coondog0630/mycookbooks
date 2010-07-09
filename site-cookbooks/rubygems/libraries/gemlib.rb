class Chef
  class Recipe
    # for iterating through the entire list, makes  building recipes easier :)
    def all_gems(&block)
      @node[:gem][:list].each do |name, ver|
        block.call(name, ver)
      end
    end
  end
end