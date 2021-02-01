######################### print on failure.

BEGIN { $| = 1; }
END {print "ERROR: System NOT Loaded\n" unless $loaded;}
use Essbase;
$loaded = 1;

######################### 

sub create_user
{
# In connect statements, replace the sample login details. 
    my $dbh = Essbase->connect("admin", "pass1", "localhost");

# Create array of users.    
    @user = (
        "Fred",
        "George",
        "Mary",
     );

# Create array of passwords.
    @password = (
        "password1",
        "password2",
        "password3",
    );

    $i = 0;

    while ($i le 2) {

    $username = $user[$i];
    $newpassword = $password[$i];
    $j = $i + 1;

    print $dbh->do("create user $username identified by $newpassword") == 0 ? "user$j created\n" : "ERROR: user user$j NOT created\n";

    $i = $i + 1;

    }

    print $dbh->disconnect() == 0 ? "Essbase database handle released\n" : "ERROR: Essbase database handle NOT released\n";
}


# 
# Create user test.
#
&create_user;