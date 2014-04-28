#!/usr/bin/perl
use GD;

open(PNG,'screenshot.png') or die "Couldn't open png. $!";

$image = GD::Image->newFromPng(PNG);

close(PNG);

$width = $image->width();
$height = $image->height();
@coords = ();

foreach my $x (0.7 * $width .. $width){
	foreach my $y (0.7 * $height .. $height){
		$index = $image->getPixel($x,$y);
		($r,$g,$b) = $image->rgb($index);
		if (($r > 240) && ($g < 45) && ($b < 45)) {
			push @coords,"$x $y";
		}
	}
}

print $coords[int($#coords / 2)];
