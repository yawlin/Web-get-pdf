#!/usr/local/bin/perl

sub parr {
    my $aname = shift;
    print "Array: \@$aname = (" . join(', ', @$aname ) . ")\n";
}

@mya = (1..20) ; parr( mya );

use LWP::Simple;

$url= "http://www.most.gov.tw/sd_ebook/";

$dd = 1800;
for ( 4..5 ) {
    $dd = 1800 + $_; $mm = 540 + $_;
	#was: $urlpdf = $url."$mm/sd-$mm.pdf";
	$urlpdf = $url."$mm/sd-$mm.pdf";
    print "$urlpdf\n";
    my $cont = get( $urlpdf );
    open outf, ">$dd-$mm.pdf" ; binmode (outf);
    print outf $cont;
    close outf;
}
print "\npause ..."; <> #pause ...
