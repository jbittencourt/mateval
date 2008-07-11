module ClassroomsHelper
  def select_year(distinct_years,year)
  	output = []
  # output << observe_field("classroom_year", :frequency => 0.5, :update => :dashboard_content, :url => { :action => "update_classrooms" })
 # output << observe_field("classroom_year", :frequency => 1, :function => "alert('Element changed')")

   output << "Ano " + select("classroom", "year", distinct_years, {:selected => year, :include_blank => "todos"},{:onchange => remote_function(:update =>'dashboard', :url => { :action => 'update_objectives'}, :with => "'year='+this.value")  })
   return output.join("\n");


  end
end
