<h1>Novo Objetivo</h1>


<% form_for :objectives do |f| -%>
<p><label for="name">Nome</label><br/>
<%= f.text_field :name %></p>

<p><label for="username">Objetivo</label><br/>
<%= f.text_field :objective %></p>

<p>
	<%= submit_tag "Criar" %>
</p>

<% end %>


