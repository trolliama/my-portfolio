module TagManager
    extend ActiveSupport::Concern

    def all_tags
        tag_list = []
        contexts = self.class.class_variable_get(:@@contexts)

        contexts.each do |context|
           tag_list.concat self.tag_list_on(context)
        end
        
        tag_list
    end
end