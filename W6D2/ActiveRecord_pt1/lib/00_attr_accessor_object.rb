class AttrAccessorObject
  def self.my_attr_accessor(*names) #:name, :age, :color
    names.each do |ivar|
      
      #define the getter method 
      # def
      define_method(ivar) do  #passed in :name
        instance_variable_get("@#{ivar}") # @name
      end

      #define the setter method 
      define_method("#{ivar}=") do |val|
        instance_variable_set("@#{ivar}", val)
      end

    end
  end
end


