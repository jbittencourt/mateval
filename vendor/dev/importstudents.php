<?

	//importar o .sql para o primeiro banco!!
	
	//config do primeiro banco
	$host = "localhost";
	$username = "root";	
	$password = "dificil";
	$database = "teste";
	
	$db=mysql_connect($host, $username, $password);	
	mysql_select_db($database,$db);
	
	$sql = "SELECT * FROM blogs";
	$result = mysql_query($sql,$db);
	$students = mysql_fetch_array($result);
	
	//segundo banco
	$database = "mateval_development";
	$db=mysql_connect($host, $username, $password);
	mysql_select_db($database,$db);
		
	$date=date('Y-m-d H:i:m');
	
	
	
	while($s = mysql_fetch_array($result))
	{
		print_r($s);
		echo "<br/>";

	$query = "INSERT INTO students ( 
		`id`, 
		`name`, 
		`picture`, 
		`amadis_username`, 
		`email`, 
		`city`, 
		`state`, 
		`cep`, 
		`transfered`, 
		`obs`, 
		`created_at`, 
		`updated_at` ) 
		VALUES (
		'".$s['id']."', 
		'".$s['name']."', 
		'".$s['picture']."', 
		'".$s['amadis_username']."', 
		'".$s['email']."',
		'".$s['city']."', 
		'".$s['state']."', 
		'".$s['cep']."', 
		'".$s['transfered']."', 
		'".$s['obs']."', 
		'".$date."', 
		'".$date."' )";
	
	mysql_query($query,$db) or die(mysql_error()."<br>".$query);
		
				
	
	}
	
	
?>
