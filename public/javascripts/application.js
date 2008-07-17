// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
var Application = {

	showAddArea : function() {
		$('add_content').show();
	},
    
    current_item_opened: null,
    
    showEntry : function(id) {
        if(this.current_item_opened == null){
            $('item_content_row_' + id).show();
            this.current_item_opened = id;
        } else {
            $('item_content_row_' + this.current_item_opened).hide();
            $('item_content_row_' + id).show();
            this.current_item_opened = id;
        }
    }
    
}

function loadStudents(select,student_select)
{
	//var select = 'diario_de_classe_post_classroom';
	//var student_select = 'diario_de_classe_post_student';
	new Ajax.Updater(student_select, 
		'/classrooms/list_students/'+$(select)[$(select).selectedIndex].value,
		{ evalScripts : true, method : 'get' }
	);
	$(student_select).disabled = false;
	
}
