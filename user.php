<html>
<title>InstantGramme</title>
<link rel="icon" href="logo.png" />
<!-- <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"> -->
<!-- Compiled and minified CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/css/materialize.min.css">

  <!-- Compiled and minified JavaScript -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/js/materialize.min.js"></script>



	<body>

		<div class="navbar-fixed">
	<nav>
		<div class="nav-wrapper #4db6ac teal lighten-2">
			<a href="edit.php" class="brand-logo"><img width="50" height="50" src="logo.png"</a>
			<ul class="right hide-on-med-and-down">
				<li><a href="edit.php">Home</a></li>
				<li><a href="user.php">Profile</a></li>
				<li><a href="about.html">About</a></li>
				<li><a href="help.html">Help</a></li>
        <li><a href="logout.php">Logout</a></li>
			</ul>
		</div>
	</nav>
</div>


<div class='container'>



	<?php

	    // pass in some info;
		require("common.php");

		if(empty($_SESSION['user'])) {

			// If they are not, we redirect them to the login page.
			$location = "http://" . $_SERVER['HTTP_HOST'] . "/login.php";
			echo '<META HTTP-EQUIV="refresh" CONTENT="0;URL='.$location.'">';
			//exit;

        	// Remember that this die statement is absolutely critical.  Without it,
        	// people can view your members-only content without logging in.
        	die("Redirecting to login.php");
    	}

		// To access $_SESSION['user'] values put in an array, show user his username
		$arr = array_values($_SESSION['user']);
		$user = $arr[1];
    $image = $arr[5];
		$query = "SELECT * FROM symbols WHERE country = '$user'";


		// open connection
		$connection = mysqli_connect($host, $username, $password) or die ("Unable to connect!");

		// select database
		mysqli_select_db($connection, $dbname) or die ("Unable to select database!");

		// create query



		// execute query
$result = mysqli_query($connection,$query) or die ("Error in query: $query. ".mysql_error());

echo "<h3><center>Your Profile</h3></center>";


		// see if any rows were returned
		if (mysqli_num_rows($result) > 0) {

    		// print them one after another
        echo "<div class='container'><table class='striped'>";
        echo "    <thead>
        <tr>
        <th>Raster Representation of User</th>
        <th>Alias Surname</th>
        <th>Memorandums</th>
        </tr>
        </thead>";
        while($row = mysqli_fetch_row($result)) {
            echo "<tr>";
        echo "<td><img width=50 height=50 src=".$arr[3]." /></td>";
            echo "<td><div class='chip'>" . $row[1]."</div></td>";
            echo "<td>".$row[2]."</td>";
        echo "<td><a href=".$_SERVER['PHP_SELF']."?id=".$row[0].">Delete</a></td>";
            echo "</tr>";
        }
        echo "</table></div>";

		} else {

    		// print status message
    		echo "No rows found!";
		}

		// free result set memory
		mysqli_free_result($connection,$result);


		// set variable values to HTML form inputs
		$country = $_POST['country'];
    $animal = $_POST['animal'];

		// check to see if user has entered anything
		if ($animal != "") {
	 		// build SQL query
      $sql_safe = addslashes($animal);
      $temp_image = $arr[3];
			$query = "INSERT INTO symbols (country, animal, image) VALUES ('$user', '$sql_safe', '$arr[3]')";

			// run the query
     		$result = mysqli_query($connection,$query) or die ("Error in query: $query. ".mysql_error());
			// refresh the page to show new update
	 		echo "<meta http-equiv='refresh' content='0'>";
		}

		// if DELETE pressed, set an id, if id is set then delete it from DB
		if (isset($_GET['id'])) {

			// create query to delete record
			echo $_SERVER['PHP_SELF'];
    		$query = "DELETE FROM symbols WHERE id = ".$_GET['id'];

			// run the query
     		$result = mysqli_query($connection,$query) or die ("Error in query: $query. ".mysql_error());

			// reset the url to remove id $_GET variable
			$location = "http://" . $_SERVER['HTTP_HOST'] . $_SERVER['PHP_SELF'];
			echo '<META HTTP-EQUIV="refresh" CONTENT="0;URL='.$location.'">';
			exit;

		}

		// close connection
		mysqli_close($connection);

	?>

		<br />
		<br />

    <div class="container">
    <form action="<?=$_SERVER['PHP_SELF']?>" method="post">
      Sanction a memorandum: <input type="text" name="animal">
      <input class="waves-effect waves-light btn" type="submit" name="Sanction">
    </form>
  </div>
    <!-- This is the HTML form that appears in the browser -->
    <footer>
    <div class="footer-copyright">
            <div class="container">
              <center>
            © 2017 InstantGramme
              </center>
            <a class="grey-text text-lighten-4 right" href="#!">More Links</a>
            </div>
          </div>
    </footer>

	</body>
</html>
