package WWW::eBridge;
use warnings;
use strict;
use SOAP::Lite;
use 5.008001;
our $VERSION = '0.17';

sub new {

	my $class = shift;
	my $self  = {};

	bless( $self, $class );
	return $self;

}

sub Sane {
	my $self = shift;
	#sanity test code goes here, no more fucking with my good subs
	my ($one, $two, $three) = @_;
	#print $self, "\n";
	print $one, "\n";
	print $two, "\n";
	print $three, "\n";
	
}

sub AddUser {

	my $self = shift;

	my ($username, $password, $cabinet, $newuser, $newpassword) = @_;

	my $soap =
	  SOAP::Lite->uri('https://app.ebridge.com/')
	  ->on_action( sub { join '/', 'https://app.ebridge.com/', $_[1] } )
	  ->proxy('https://app.ebridge.com/ebridge/webservices/ebridge.asmx');

	my $method =
	  SOAP::Data->name('AddUser')->attr( { xmlns => 'https://app.ebridge.com/' } );

	my @params = ( SOAP::Data->name( User => $username ) );
	push( @params, SOAP::Data->name( Password    => $password ) );
	push( @params, SOAP::Data->name( Cabinet     => $cabinet ) );
	push( @params, SOAP::Data->name( NewUser     => $newuser ) );
	push( @params, SOAP::Data->name( NewPassword => $newpassword ) );
	push( @params, SOAP::Data->name( Reserved1   => "" ) );
	push( @params, SOAP::Data->name( Reserved2   => "" ) );
	push( @params, SOAP::Data->name( Reserved3   => "" ) );

	print $soap->call( $method => @params )->result;

}

#TODO: Unfuck every sub due to assumptions made without testing

sub BatchAdd {

	my $self = shift;

	open INFILE, '<', $_[0];

	binmode INFILE;

	my $username       = $_[1];
	my $password       = $_[2];
	my $cabinet        = $_[3];
	my $batchid        = $_[4];
	my $originfilename = $_[5];

	my ( $file, $data, $i );

	while ( ( $i = read INFILE, $file, 4096 ) != 0 ) {

		$data .= $file;

	}

	my $soap =
	  SOAP::Lite->uri('https://app.ebridge.com/')
	  ->on_action( sub { join '/', 'https://app.ebridge.com/', $_[1] } )
	  ->proxy('https://app.ebridge.com/ebridge/webservices/ebridge.asmx');

	my $method =
	  SOAP::Data->name($self)->attr( { xmlns => 'https://app.ebridge.com/' } );

	my @params = ( SOAP::Data->name( User => $username ) );
	push( @params, SOAP::Data->name( Password         => $password ) );
	push( @params, SOAP::Data->name( Cabinet          => $cabinet ) );
	push( @params, SOAP::Data->name( BatchId          => $batchid ) );
	push( @params, SOAP::Data->name( OriginalFileName => $originfilename ) );
	push( @params, SOAP::Data->name( b                => $data ) );

	return $soap->call( $method => @params )->result;
}

sub BatchEnd {

	my $self = shift;

	my $username = $_[0];
	my $password = $_[1];
	my $cabinet  = $_[2];
	my $batchid  = $_[3];
	my $index1   = $_[4];
	my $index2   = $_[5];
	my $index3   = $_[6];
	my $index4   = $_[7];
	my $index5   = $_[8];
	my $index6   = $_[9];
	my $index7   = $_[10];


	my $soap =
	  SOAP::Lite->uri('https://app.ebridge.com/')
	  ->on_action( sub { join '/', 'https://app.ebridge.com/', $_[1] } )
	  ->proxy('https://app.ebridge.com/ebridge/webservices/ebridge.asmx');

	my $method =
	  SOAP::Data->name($self)->attr( { xmlns => 'https://app.ebridge.com/' } );

	my @params = ( SOAP::Data->name( User => $username ) );
	push( @params, SOAP::Data->name( Password => $password ) );
	push( @params, SOAP::Data->name( Cabinet  => $cabinet ) );
	push( @params, SOAP::Data->name( BatchId  => $batchid ) );
	push( @params, SOAP::Data->name( Index1   => $index1 ) );
	push( @params, SOAP::Data->name( Index2   => $index2 ) );
	push( @params, SOAP::Data->name( Index3   => $index3 ) );
	push( @params, SOAP::Data->name( Index4   => $index4 ) );
	push( @params, SOAP::Data->name( Index5   => $index5 ) );
	push( @params, SOAP::Data->name( Index6   => $index6 ) );
	push( @params, SOAP::Data->name( Index7   => $index7 ) );

	return $soap->call( $method => @params )->result;

}

sub BatchStart {

	my $self = shift;

	my $username = $_[0];
	my $password = $_[1];
	my $cabinet  = $_[2];

	my $soap =
	  SOAP::Lite->uri('https://app.ebridge.com/')
	  ->on_action( sub { join '/', 'https://app.ebridge.com/', $_[1] } )
	  ->proxy('https://app.ebridge.com/ebridge/webservices/ebridge.asmx');

	my $method =
	  SOAP::Data->name($self)->attr( { xmlns => 'https://app.ebridge.com/' } );

	my @params = ( SOAP::Data->name( User => $username ) );
	push( @params, SOAP::Data->name( Password => $password ) );
	push( @params, SOAP::Data->name( Cabinet  => $cabinet ) );

	return $soap->call( $method => @params )->result;

}

sub DeleteFile {

	my $self = shift;

	my $username = $_[0];
	my $password = $_[1];
	my $cabinet  = $_[2];
	my $objectid = $_[3];

	my $soap =
	  SOAP::Lite->uri('https://app.ebridge.com/')
	  ->on_action( sub { join '/', 'https://app.ebridge.com/', $_[1] } )
	  ->proxy('https://app.ebridge.com/ebridge/webservices/ebridge.asmx');

	my $method =
	  SOAP::Data->name($self)->attr( { xmlns => 'https://app.ebridge.com/' } );

	my @params = ( SOAP::Data->name( User => $username ) );
	push( @params, SOAP::Data->name( Password => $password ) );
	push( @params, SOAP::Data->name( Cabinet  => $cabinet ) );
	push( @params, SOAP::Data->name( ObjectId => $objectid ) );

	return $soap->call( $method => @params )->result;

}

sub DeleteUser {

	my $self = shift;

	my $username   = $_[0];
	my $password   = $_[1];
	my $cabinet    = $_[2];
	my $deleteuser = $_[3];

	my $soap =
	  SOAP::Lite->uri('https://app.ebridge.com/')
	  ->on_action( sub { join '/', 'https://app.ebridge.com/', $_[1] } )
	  ->proxy('https://app.ebridge.com/ebridge/webservices/ebridge.asmx');

	my $method =
	  SOAP::Data->name($self)->attr( { xmlns => 'https://app.ebridge.com/' } );

	my @params = ( SOAP::Data->name( User => $username ) );
	push( @params, SOAP::Data->name( Password     => $password ) );
	push( @params, SOAP::Data->name( Cabinet      => $cabinet ) );
	push( @params, SOAP::Data->name( UserToDelete => $deleteuser ) );

	return $soap->call( $method => @params )->result;

}

sub FileUpload {

	my $self = shift;

	open INFILE, '<', $_[0];

	binmode INFILE;

	my $username = $_[1];
	my $password = $_[2];
	my $cabinet  = $_[3];
	my $index1   = $_[4];
	my $index2   = $_[5];
	my $index3   = $_[6];
	my $index4   = $_[7];
	my $index5   = $_[8];
	my $index6   = $_[9];
	my $index7   = $_[10];

	my ( $file, $data, $i );

	while ( ( $i = read INFILE, $file, 4096 ) != 0 ) {

		$data .= $file;

	}

	my $soap =
	  SOAP::Lite->uri('https://app.ebridge.com/')
	  ->on_action( sub { join '/', 'https://app.ebridge.com/', $_[1] } )
	  ->proxy('https://app.ebridge.com/ebridge/webservices/ebridge.asmx');

	my $method =
	  SOAP::Data->name($self)->attr( { xmlns => 'https://app.ebridge.com/' } );

	my @params = ( SOAP::Data->name( User => $username ) );
	push( @params, SOAP::Data->name( Password => $password ) );
	push( @params, SOAP::Data->name( Cabinet  => $cabinet ) );
	push( @params, SOAP::Data->name( b        => $data ) );
	push( @params, SOAP::Data->name( FileName => "eBridgeFile.PDF" ) );
	push( @params, SOAP::Data->name( Index1   => $index1 ) );
	push( @params, SOAP::Data->name( Index2   => $index2 ) );
	push( @params, SOAP::Data->name( Index3   => $index3 ) );
	push( @params, SOAP::Data->name( Index4   => $index4 ) );
	push( @params, SOAP::Data->name( Index5   => $index5 ) );
	push( @params, SOAP::Data->name( Index6   => $index6 ) );
	push( @params, SOAP::Data->name( Index7   => $index7 ) );

	return $soap->call( $method => @params )->result;

}

sub FileUploadEx {

	my $self = shift;

	open INFILE, '<', $_[0];

	binmode INFILE;

	my $username = $_[1];
	my $password = $_[2];
	my $cabinet  = $_[3];
	my $index1   = $_[4];
	my $index2   = $_[5];
	my $index3   = $_[6];
	my $index4   = $_[7];
	my $index5   = $_[8];
	my $index6   = $_[9];
	my $index7   = $_[10];

	my ( $file, $data, $i );

	while ( ( $i = read INFILE, $file, 4096 ) != 0 ) {

		$data .= $file;

	}

	my $soap =
	  SOAP::Lite->uri('https://app.ebridge.com/')
	  ->on_action( sub { join '/', 'https://app.ebridge.com/', $_[1] } )
	  ->proxy('https://app.ebridge.com/ebridge/webservices/ebridge.asmx');

	my $method =
	  SOAP::Data->name($self)->attr( { xmlns => 'https://app.ebridge.com/' } );

	my @params = ( SOAP::Data->name( User => $username ) );
	push( @params, SOAP::Data->name( Password       => $password ) );
	push( @params, SOAP::Data->name( Cabinet        => $cabinet ) );
	push( @params, SOAP::Data->name( FileByteString => $data ) );
	push( @params, SOAP::Data->name( FileName       => "eBridgeFile.PDF" ) );
	push( @params, SOAP::Data->name( Index1         => $index1 ) );
	push( @params, SOAP::Data->name( Index2         => $index2 ) );
	push( @params, SOAP::Data->name( Index3         => $index3 ) );
	push( @params, SOAP::Data->name( Index4         => $index4 ) );
	push( @params, SOAP::Data->name( Index5         => $index5 ) );
	push( @params, SOAP::Data->name( Index6         => $index6 ) );
	push( @params, SOAP::Data->name( Index7         => $index7 ) );

	return $soap->call( $method => @params )->result;

}

sub GetDoc {

	my $self = shift;

	my $username = $_[0];
	my $password = $_[1];
	my $cabinet  = $_[2];
	my $objectid = $_[3];

	my $soap =
	  SOAP::Lite->uri('https://app.ebridge.com/')
	  ->on_action( sub { join '/', 'https://app.ebridge.com/', $_[1] } )
	  ->proxy('https://app.ebridge.com/ebridge/webservices/ebridge.asmx');

	my $method =
	  SOAP::Data->name($self)->attr( { xmlns => 'https://app.ebridge.com/' } );

	my @params = ( SOAP::Data->name( User => $username ) );
	push( @params, SOAP::Data->name( Password => $password ) );
	push( @params, SOAP::Data->name( Cabinet  => $cabinet ) );
	push( @params, SOAP::Data->name( ObjectId => $objectid ) );

	return $soap->call( $method => @params )->result;

}

sub GetDocumentAudit {

	my $self = shift;

	my $username = $_[0];
	my $password = $_[1];
	my $cabinet  = $_[2];
	my $objectid = $_[3];

	my $soap =
	  SOAP::Lite->uri('https://app.ebridge.com/')
	  ->on_action( sub { join '/', 'https://app.ebridge.com/', $_[1] } )
	  ->proxy('https://app.ebridge.com/ebridge/webservices/ebridge.asmx');

	my $method =
	  SOAP::Data->name($self)->attr( { xmlns => 'https://app.ebridge.com/' } );

	my @params = ( SOAP::Data->name( User => $username ) );
	push( @params, SOAP::Data->name( Password => $password ) );
	push( @params, SOAP::Data->name( Cabinet  => $cabinet ) );
	push( @params, SOAP::Data->name( ObjectId => $objectid ) );

	return $soap->call( $method => @params )->result;

}

sub GetFileType {

	my $self = shift;

	my $username = $_[0];
	my $password = $_[1];
	my $cabinet  = $_[2];

	my $soap =
	  SOAP::Lite->uri('https://app.ebridge.com/')
	  ->on_action( sub { join '/', 'https://app.ebridge.com/', $_[1] } )
	  ->proxy('https://app.ebridge.com/ebridge/webservices/ebridge.asmx');

	my $method =
	  SOAP::Data->name($self)->attr( { xmlns => 'https://app.ebridge.com/' } );

	my @params = ( SOAP::Data->name( User => $username ) );
	push( @params, SOAP::Data->name( Password => $password ) );
	push( @params, SOAP::Data->name( Cabinet  => $cabinet ) );

	return $soap->call( $method => @params )->result;

}

sub GetIndexes {

	my $self = shift;

	my $username = $_[0];
	my $password = $_[1];
	my $cabinet  = $_[2];

	my $soap =
	  SOAP::Lite->uri('https://app.ebridge.com/')
	  ->on_action( sub { join '/', 'https://app.ebridge.com/', $_[1] } )
	  ->proxy('https://app.ebridge.com/ebridge/webservices/ebridge.asmx');

	my $method =
	  SOAP::Data->name($self)->attr( { xmlns => 'https://app.ebridge.com/' } );

	my @params = ( SOAP::Data->name( User => $username ) );
	push( @params, SOAP::Data->name( Password => $password ) );
	push( @params, SOAP::Data->name( Cabinet  => $cabinet ) );

	return $soap->call( $method => @params )->result;

}

sub GetMonthlyPageCount {

	my $self = shift;

	my $username = $_[0];
	my $password = $_[1];
	my $cabinet  = $_[2];

	my $soap =
	  SOAP::Lite->uri('https://app.ebridge.com/')
	  ->on_action( sub { join '/', 'https://app.ebridge.com/', $_[1] } )
	  ->proxy('https://app.ebridge.com/ebridge/webservices/ebridge.asmx');

	my $method =
	  SOAP::Data->name($self)->attr( { xmlns => 'https://app.ebridge.com/' } );

	my @params = ( SOAP::Data->name( User => $username ) );
	push( @params, SOAP::Data->name( Password => $password ) );
	push( @params, SOAP::Data->name( Cabinet  => $cabinet ) );

	return $soap->call( $method => @params )->result;

}

sub GetObjectIndexes {

	my $self = shift;

	my $username = $_[0];
	my $password = $_[1];
	my $cabinet  = $_[2];
	my $objectid = $_[3];

	my $soap =
	  SOAP::Lite->uri('https://app.ebridge.com/')
	  ->on_action( sub { join '/', 'https://app.ebridge.com/', $_[1] } )
	  ->proxy('https://app.ebridge.com/ebridge/webservices/ebridge.asmx');

	my $method =
	  SOAP::Data->name($self)->attr( { xmlns => 'https://app.ebridge.com/' } );

	my @params = ( SOAP::Data->name( User => $username ) );
	push( @params, SOAP::Data->name( Password => $password ) );
	push( @params, SOAP::Data->name( Cabinet  => $cabinet ) );
	push( @params, SOAP::Data->name( ObjectId => $objectid ) );

	return $soap->call( $method => @params )->result;

}

sub GetPermissions {

	my $self = shift;

	my $username   = $_[0];
	my $password   = $_[1];
	my $cabinet    = $_[2];
	my $targetuser = $_[3];
	my $permission = $_[4];

	my $soap =
	  SOAP::Lite->uri('https://app.ebridge.com/')
	  ->on_action( sub { join '/', 'https://app.ebridge.com/', $_[1] } )
	  ->proxy('https://app.ebridge.com/ebridge/webservices/ebridge.asmx');

	my $method =
	  SOAP::Data->name($self)->attr( { xmlns => 'https://app.ebridge.com/' } );

	my @params = ( SOAP::Data->name( User => $username ) );
	push( @params, SOAP::Data->name( Password   => $password ) );
	push( @params, SOAP::Data->name( Cabinet    => $cabinet ) );
	push( @params, SOAP::Data->name( UserName   => $targetuser ) );
	push( @params, SOAP::Data->name( Permission => $permission ) )
	  ;    #returns 1 if they have the selected permission, else 0

	return $soap->call( $method => @params )->result;

}

sub GetToken {

	my $self = shift;

	my $username = $_[0];
	my $password = $_[1];
	my $cabinet  = $_[2];

	my $soap =
	  SOAP::Lite->uri('https://app.ebridge.com/')
	  ->on_action( sub { join '/', 'https://app.ebridge.com/', $_[1] } )
	  ->proxy('https://app.ebridge.com/ebridge/webservices/ebridge.asmx');

	my $method =
	  SOAP::Data->name($self)->attr( { xmlns => 'https://app.ebridge.com/' } );

	my @params = ( SOAP::Data->name( User => $username ) );
	push( @params, SOAP::Data->name( Password => $password ) );
	push( @params, SOAP::Data->name( Cabinet  => $cabinet ) );

	return $soap->call( $method => @params )->result;
}

sub GetTokenEx {

	my $self = shift;

	my $username = $_[0];
	my $password = $_[1];
	my $cabinet  = $_[2];

	my $soap =
	  SOAP::Lite->uri('https://app.ebridge.com/')
	  ->on_action( sub { join '/', 'https://app.ebridge.com/', $_[1] } )
	  ->proxy('https://app.ebridge.com/ebridge/webservices/ebridge.asmx');

	my $method =
	  SOAP::Data->name($self)->attr( { xmlns => 'https://app.ebridge.com/' } );

	my @params = ( SOAP::Data->name( User => $username ) );
	push( @params, SOAP::Data->name( Password => $password ) );
	push( @params, SOAP::Data->name( Cabinet  => $cabinet ) );

	return $soap->call( $method => @params )->result;
}

sub GetTotalPageCount {

	my $self = shift;

	my $username = $_[0];
	my $password = $_[1];
	my $cabinet  = $_[2];

	my $soap =
	  SOAP::Lite->uri('https://app.ebridge.com/')
	  ->on_action( sub { join '/', 'https://app.ebridge.com/', $_[1] } )
	  ->proxy('https://app.ebridge.com/ebridge/webservices/ebridge.asmx');

	my $method =
	  SOAP::Data->name($self)->attr( { xmlns => 'https://app.ebridge.com/' } );

	my @params = ( SOAP::Data->name( User => $username ) );
	push( @params, SOAP::Data->name( Password => $password ) );
	push( @params, SOAP::Data->name( Cabinet  => $cabinet ) );

	return $soap->call( $method => @params )->result;

}

sub GetUserAudit {

	my $self = shift;

	my $username   = $_[0];
	my $password   = $_[1];
	my $cabinet    = $_[2];
	my $targetuser = $_[3];
	my $startdate  = $_[4];
	my $enddate    = $_[5];

	my $soap =
	  SOAP::Lite->uri('https://app.ebridge.com/')
	  ->on_action( sub { join '/', 'https://app.ebridge.com/', $_[1] } )
	  ->proxy('https://app.ebridge.com/ebridge/webservices/ebridge.asmx');

	my $method =
	  SOAP::Data->name($self)->attr( { xmlns => 'https://app.ebridge.com/' } );

	my @params = ( SOAP::Data->name( User => $username ) );
	push( @params, SOAP::Data->name( Password  => $password ) );
	push( @params, SOAP::Data->name( Cabinet   => $cabinet ) );
	push( @params, SOAP::Data->name( UserName  => $targetuser ) );
	push( @params, SOAP::Data->name( StartDate => $startdate ) );
	push( @params, SOAP::Data->name( EndDate   => $enddate ) );

	return $soap->call( $method => @params )->result;

}

sub GetUsers {

	my $self = shift;

	my $username = $_[0];
	my $password = $_[1];
	my $cabinet  = $_[2];

	my $soap =
	  SOAP::Lite->uri('https://app.ebridge.com/')
	  ->on_action( sub { join '/', 'https://app.ebridge.com/', $_[1] } )
	  ->proxy('https://app.ebridge.com/ebridge/webservices/ebridge.asmx');

	my $method =
	  SOAP::Data->name($self)->attr( { xmlns => 'https://app.ebridge.com/' } );

	my @params = ( SOAP::Data->name( User => $username ) );
	push( @params, SOAP::Data->name( Password => $password ) );
	push( @params, SOAP::Data->name( Cabinet  => $cabinet ) );

	return $soap->call( $method => @params )->result;

}

sub GetVersion {

	my $self = shift;

	my $application = $_[0];

	my $soap =
	  SOAP::Lite->uri('https://app.ebridge.com/')
	  ->on_action( sub { join '/', 'https://app.ebridge.com/', $_[1] } )
	  ->proxy('https://app.ebridge.com/ebridge/webservices/ebridge.asmx');

	my $method =
	  SOAP::Data->name($self)->attr( { xmlns => 'https://app.ebridge.com/' } );

	my @params = ( SOAP::Data->name( Application => $application ) );

	return $soap->call( $method => @params )->result;

}

sub Search {

	my $self = shift;

	my $username  = $_[1];
	my $password  = $_[2];
	my $cabinet   = $_[3];
	my $index1    = $_[4];
	my $index2    = $_[5];
	my $index3    = $_[6];
	my $index4    = $_[7];
	my $index5    = $_[8];
	my $index6    = $_[9];
	my $index7    = $_[10];
	my $startdate = $_[11];
	my $enddate   = $_[12];

	my $soap =
	  SOAP::Lite->uri('https://app.ebridge.com/')
	  ->on_action( sub { join '/', 'https://app.ebridge.com/', $_[1] } )
	  ->proxy('https://app.ebridge.com/ebridge/webservices/ebridge.asmx');

	my $method =
	  SOAP::Data->name($self)->attr( { xmlns => 'https://app.ebridge.com/' } );

	my @params = ( SOAP::Data->name( User => $username ) );
	push( @params, SOAP::Data->name( Password  => $password ) );
	push( @params, SOAP::Data->name( Cabinet   => $cabinet ) );
	push( @params, SOAP::Data->name( Index1    => $index1 ) );
	push( @params, SOAP::Data->name( Index2    => $index2 ) );
	push( @params, SOAP::Data->name( Index3    => $index3 ) );
	push( @params, SOAP::Data->name( Index4    => $index4 ) );
	push( @params, SOAP::Data->name( Index5    => $index5 ) );
	push( @params, SOAP::Data->name( Index6    => $index6 ) );
	push( @params, SOAP::Data->name( Index7    => $index7 ) );
	push( @params, SOAP::Data->name( StartDate => $startdate ) );
	push( @params, SOAP::Data->name( EndDate   => $enddate ) );

	return $soap->call( $method => @params )->result;

}

sub SearchEx {

	my $self = shift;

	my $username  = $_[1];
	my $password  = $_[2];
	my $cabinet   = $_[3];
	my $index1    = $_[4];
	my $index2    = $_[5];
	my $index3    = $_[6];
	my $index4    = $_[7];
	my $index5    = $_[8];
	my $index6    = $_[9];
	my $index7    = $_[10];
	my $startdate = $_[11];
	my $enddate   = $_[12];
	my $ocrtext   = $_[13];

	my $soap =
	  SOAP::Lite->uri('https://app.ebridge.com/')
	  ->on_action( sub { join '/', 'https://app.ebridge.com/', $_[1] } )
	  ->proxy('https://app.ebridge.com/ebridge/webservices/ebridge.asmx');

	my $method =
	  SOAP::Data->name($self)->attr( { xmlns => 'https://app.ebridge.com/' } );

	my @params = ( SOAP::Data->name( User => $username ) );
	push( @params, SOAP::Data->name( Password  => $password ) );
	push( @params, SOAP::Data->name( Cabinet   => $cabinet ) );
	push( @params, SOAP::Data->name( Index1    => $index1 ) );
	push( @params, SOAP::Data->name( Index2    => $index2 ) );
	push( @params, SOAP::Data->name( Index3    => $index3 ) );
	push( @params, SOAP::Data->name( Index4    => $index4 ) );
	push( @params, SOAP::Data->name( Index5    => $index5 ) );
	push( @params, SOAP::Data->name( Index6    => $index6 ) );
	push( @params, SOAP::Data->name( Index7    => $index7 ) );
	push( @params, SOAP::Data->name( StartDate => $startdate ) );
	push( @params, SOAP::Data->name( EndDate   => $enddate ) );
	push( @params, SOAP::Date->name( OCRText   => $ocrtext ) );

	return $soap->call( $method => @params )->result;

}

sub SetPermissions {

	my $self = shift;

	my $username   = $_[0];
	my $password   = $_[1];
	my $cabinet    = $_[2];
	my $targetuser = $_[3];
	my $permission = $_[4];
	my $value      = $_[5];

	my $soap =
	  SOAP::Lite->uri('https://app.ebridge.com/')
	  ->on_action( sub { join '/', 'https://app.ebridge.com/', $_[1] } )
	  ->proxy('https://app.ebridge.com/ebridge/webservices/ebridge.asmx');

	my $method =
	  SOAP::Data->name($self)->attr( { xmlns => 'https://app.ebridge.com/' } );

	my @params = ( SOAP::Data->name( User => $username ) );
	push( @params, SOAP::Data->name( Password   => $password ) );
	push( @params, SOAP::Data->name( Cabinet    => $cabinet ) );
	push( @params, SOAP::Data->name( UserName   => $targetuser ) );
	push( @params, SOAP::Data->name( Permission => $permission ) );
	push( @params, SOAP::Data->name( Value      => $value ) );

	return $soap->call( $method => @params )->result;

}

sub UpdateIndexes {

	my $self = shift;

	my $username = $_[1];
	my $password = $_[2];
	my $cabinet  = $_[3];
	my $objectid = $_[4];
	my $index1   = $_[5];
	my $index2   = $_[6];
	my $index3   = $_[7];
	my $index4   = $_[8];
	my $index5   = $_[9];
	my $index6   = $_[10];
	my $index7   = $_[11];

	my $soap =
	  SOAP::Lite->uri('https://app.ebridge.com/')
	  ->on_action( sub { join '/', 'https://app.ebridge.com/', $_[1] } )
	  ->proxy('https://app.ebridge.com/ebridge/webservices/ebridge.asmx');

	my $method =
	  SOAP::Data->name($self)->attr( { xmlns => 'https://app.ebridge.com/' } );

	my @params = ( SOAP::Data->name( User => $username ) );
	push( @params, SOAP::Data->name( Password => $password ) );
	push( @params, SOAP::Data->name( Cabinet  => $cabinet ) );
	push( @params, SOAP::Data->name( ObjectId => $objectid ) );
	push( @params, SOAP::Data->name( Index1   => $index1 ) );
	push( @params, SOAP::Data->name( Index2   => $index2 ) );
	push( @params, SOAP::Data->name( Index3   => $index3 ) );
	push( @params, SOAP::Data->name( Index4   => $index4 ) );
	push( @params, SOAP::Data->name( Index5   => $index5 ) );
	push( @params, SOAP::Data->name( Index6   => $index6 ) );
	push( @params, SOAP::Data->name( Index7   => $index7 ) );

	return $soap->call( $method => @params )->result;

}

=head1 NAME

WWW::eBridge - The great new WWW::eBridge!

=head1 VERSION

Version 0.01


=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use WWW::eBridge;

    my $foo = WWW::eBridge->new();
    ...


=head1 AUTHOR

Miguel Pereira, C<< <perlproxy at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-www-ebridge at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=WWW-eBridge>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc WWW::eBridge


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=WWW-eBridge>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/WWW-eBridge>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/WWW-eBridge>

=item * Search CPAN

L<http://search.cpan.org/dist/WWW-eBridge/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2012 Miguel Pereira.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1;    # End of WWW::eBridge
