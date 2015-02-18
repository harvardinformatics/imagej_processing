open("/n/home_rc/bfreeman/classes/tips_imagej/samples/temp/flybrain.tif");
run("Size...", "width=192 height=192 depth=57 constrain average interpolation=Bilinear");
saveAs("Tiff", "/n/home_rc/bfreeman/classes/tips_imagej/samples/temp/flybrain.downsized.tif");
close();
