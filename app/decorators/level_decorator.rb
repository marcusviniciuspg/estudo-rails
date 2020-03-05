class LevelDecorator
  def self.collection_to_tree(collection)
    collection.map do |c|
      {
        "#{c[:level_name]}": c[:disciplines].map do |d|
          { 
            name: d
          }
        end
      }
    end
  end  
end