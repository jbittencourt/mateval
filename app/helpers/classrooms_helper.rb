module ClassroomsHelper
  def select_year(distinct_years,place)
  	output = []
  # output << observe_field("classroom_year", :frequency => 0.5, :update => :dashboard_content, :url => { :action => "update_classrooms" })
 # output << observe_field("classroom_year", :frequency => 1, :function => "alert('Element changed')")

  # output << "Ano " + select("classroom", "year", distinct_years, {:selected => year, :include_blank => "todos"},{:onchange => remote_function(:update =>'dashboard', :url => { :action => 'update_objectives'}, :with => "'year='+this.value")  })
  if place == "index"
  output << "Ano " + select("classroom", "year", distinct_years, {:selected => params[:year].to_i, :include_blank => "todos"},{:onchange => "window.location.href = '/classrooms/?year='+this.value;"} )
  else
  output << "Ano " + select("classroom", "year", distinct_years, {:selected => params[:year].to_i, :include_blank => "todos"},{:onchange => "window.location.href = '/classrooms/"+place+"?year='+this.value;"} )
  end
   return output.join("\n");


  end
end
