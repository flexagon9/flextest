# Use the Essbase.pm module. This statement is required to use Essbase within a Perl script. 
use Essbase; 
 
# Create a handle to the Essbase Server by connecting as admin, mypassword to the local machine. 
my $dbh = Essbase->connect("admin", "mypassword", "localhost"); 

# Use the do Perl function to pass the MaxL create user statement (enclosed in quotation marks) to the Essbase Server. 
$dbh->do("create user Essbase identified by mypassword"); 

# Disconnect from the Essbase Server. 
$dbh->disconnect();